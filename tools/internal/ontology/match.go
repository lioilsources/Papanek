package ontology

import "strings"

// Confidence říká, jak moc se dá výsledku věřit bez člověka (plán §7).
type Confidence int

const (
	None    Confidence = iota // nic nenalezeno → review fronta
	Low                       // částečná shoda, např. „tomato sauce“ na „tomato“ → review fronta
	Fuzzy                     // překlep v celém názvu
	Partial                   // alias je hlava názvu, zbytek jsou přívlastky
	Exact                     // celý název je alias
)

// Match je výsledek mapování názvu na surovinu.
type Match struct {
	Slug       string
	Alias      string
	Confidence Confidence
}

// Automatic říká, jestli výsledek smí do DB bez ruční kontroly.
func (m Match) Automatic() bool { return m.Confidence >= Fuzzy }

// Matcher hledá v aliasech jednoho jazyka.
type Matcher struct {
	lang    string
	exact   map[string]string // s diakritikou: „mušlí“ ≠ „müsli“
	aliases map[string]string // bez diakritiky, jen jednoznačné tvary
	maxLen  int
	grams   map[string][]string
}

// NewMatcher postaví index pro jazyk cs nebo en.
func NewMatcher(items []Ingredient, lang string) *Matcher {
	m := &Matcher{lang: lang, exact: map[string]string{}, aliases: map[string]string{}, grams: map[string][]string{}}
	ambiguous := map[string]bool{}
	for _, in := range items {
		list := in.AliasesEN
		if lang == "cs" {
			list = in.AliasesCS
		}
		for _, a := range list {
			n := Normalize(a)
			if n == "" {
				continue
			}
			m.exact[strings.Join(tokens(a), " ")] = in.Slug
			if prev, ok := m.aliases[n]; ok && prev != in.Slug {
				ambiguous[n] = true
			}
			m.aliases[n] = in.Slug
			if l := len(strings.Fields(n)); l > m.maxLen {
				m.maxLen = l
			}
			for g := range trigrams(n) {
				m.grams[g] = append(m.grams[g], n)
			}
		}
	}
	for n := range ambiguous {
		delete(m.aliases, n)
	}
	return m
}

func (m *Matcher) lookup(raw string) (string, string, bool) {
	if slug, ok := m.exact[raw]; ok {
		return slug, Normalize(raw), true
	}
	n := Normalize(raw)
	slug, ok := m.aliases[n]
	return slug, n, ok
}

// Slova, která smí v angličtině stát za surovinou, aniž by změnila, o co jde.
var trailingOK = map[string]bool{
	"fresh": true, "dried": true, "chopped": true, "sliced": true, "diced": true, "minced": true,
	"grated": true, "melted": true, "softened": true, "cooked": true, "peeled": true, "crushed": true,
	"beaten": true, "ground": true, "whole": true, "large": true, "small": true, "medium": true,
	"optional": true, "taste": true, "to": true, "for": true, "of": true, "the": true, "in": true,
	"and": true, "with": true, "plus": true, "more": true, "extra": true, "serving": true,
	"garnish": true, "frying": true, "cooking": true,
	"fillet": true, "fillets": true, "florets": true, "leaves": true, "pulp": true,
}

// Find namapuje očištěný název suroviny. Bere nejdelší alias; při shodě délky
// v angličtině pravější (hlava je vpravo), v češtině levější.
func (m *Matcher) Find(name string) Match {
	toks := tokens(name)
	if len(toks) == 0 {
		return Match{}
	}
	if slug, alias, ok := m.lookup(strings.Join(toks, " ")); ok {
		return Match{slug, alias, Exact}
	}
	n := Normalize(name)
	top := min(m.maxLen, len(toks))
	for l := top; l >= 1; l-- {
		var starts []int
		for i := 0; i+l <= len(toks); i++ {
			starts = append(starts, i)
		}
		if m.lang == "en" {
			for a, b := 0, len(starts)-1; a < b; a, b = a+1, b-1 {
				starts[a], starts[b] = starts[b], starts[a]
			}
		}
		for _, i := range starts {
			slug, alias, ok := m.lookup(strings.Join(toks[i:i+l], " "))
			if !ok {
				continue
			}
			return Match{slug, alias, m.judge(toks, i+l)}
		}
	}
	if alias, ok := m.fuzzy(n); ok {
		if slug, found := m.aliases[alias]; found {
			return Match{slug, alias, Fuzzy}
		}
	}
	return Match{}
}

// judge posoudí částečnou shodu. Anglická hlava je poslední slovo: „tomato sauce“
// není „tomato“, takže neznámé slovo za aliasem shazuje důvěru na Low.
func (m *Matcher) judge(toks []string, end int) Confidence {
	if m.lang != "en" {
		return Partial
	}
	for _, t := range toks[end:] {
		if !trailingOK[Normalize(t)] {
			return Low
		}
	}
	return Partial
}

// fuzzy je trigramový fallback z §7 krok 2 pro překlepy. Práh je vysoký,
// protože chybná surovina je horší než řádek v review frontě.
func (m *Matcher) fuzzy(n string) (string, bool) {
	if len(n) < 5 {
		return "", false
	}
	query := trigrams(n)
	hits := map[string]int{}
	for g := range query {
		for _, a := range m.grams[g] {
			hits[a]++
		}
	}
	best, bestScore := "", 0.0
	for a, c := range hits {
		union := len(query) + len(trigrams(a)) - c
		score := float64(c) / float64(union)
		if score > bestScore || (score == bestScore && a < best) {
			best, bestScore = a, score
		}
	}
	return best, bestScore >= 0.65
}

func trigrams(s string) map[string]bool {
	r := []rune("  " + s + " ")
	out := map[string]bool{}
	for i := 0; i+3 <= len(r); i++ {
		out[string(r[i:i+3])] = true
	}
	return out
}
