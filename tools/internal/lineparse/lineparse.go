// Package lineparse rozebere řádek ingredience (plán §7 krok 1):
// „2 velké cibule, nakrájené“ → množství 2, název „velké cibule“, poznámka „nakrájené“.
package lineparse

import (
	"regexp"
	"strconv"
	"strings"

	"github.com/lioilsources/papanek/tools/internal/ontology"
)

// Line je rozebraný řádek. Qty == nil znamená „podle chuti“ nebo bez množství.
type Line struct {
	Raw      string
	Qty      *float64
	QtyMax   *float64 // horní mez rozsahu „1-2“
	Unit     string   // ID ze seed/units.yaml, prázdné = kusy bez jednotky
	Name     string
	Note     string
	Optional bool
}

// Parser zná aliasy jednotek.
type Parser struct {
	units  map[string]string
	maxLen int
}

// New postaví parser ze seznamu jednotek.
func New(units []ontology.Unit) *Parser {
	p := &Parser{units: map[string]string{}}
	for _, u := range units {
		for _, a := range u.Aliases {
			a = strings.ToLower(a)
			p.units[a] = u.ID
			if l := len(strings.Fields(a)); l > p.maxLen {
				p.maxLen = l
			}
		}
	}
	return p
}

var (
	vulgar = map[rune]string{
		'½': "1/2", '¼': "1/4", '¾': "3/4", '⅓': "1/3", '⅔': "2/3",
		'⅛': "1/8", '⅜': "3/8", '⅝': "5/8", '⅞': "7/8",
	}
	words = map[string]string{
		"a": "1", "an": "1", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6",
		"seven": "7", "eight": "8", "ten": "10", "twelve": "12", "half": "1/2", "half a": "1/2",
		"jeden": "1", "jedna": "1", "jedno": "1", "dva": "2", "dvě": "2", "tři": "3", "čtyři": "4",
		"pět": "5", "šest": "6", "půl": "1/2", "čtvrt": "1/4", "trochu": "", "few": "", "some": "",
		"several": "", "pár": "", "několik": "",
	}
	numberRe       = `\d+\s+\d+/\d+|\d+/\d+|\d+(?:[.,]\d+)?`
	qtyRe          = regexp.MustCompile(`^(` + numberRe + `)(?:\s*(?:-|–|—|to|až)\s*(` + numberRe + `))?\s*`)
	inlineParensRe = regexp.MustCompile(`\(([\p{L} ]+)\)(\s+\p{L})`)
	parensRe       = regexp.MustCompile(`\s*\(([^)]*)\)`)
	commaRe        = regexp.MustCompile(`,(\s|$|\D)`)
	orRe           = regexp.MustCompile(`(?i)\s(?:or|nebo|či)\s`)
	tasteRe        = regexp.MustCompile(`(?i)\b(?:to taste|as needed|podle chuti|dle chuti|podle potřeby|dle potřeby)\b`)
	optRe          = regexp.MustCompile(`(?i)\b(?:optional|optionally|volitelně|nepovinné|nepovinně|není nutné)\b`)
	lettersRe      = regexp.MustCompile(`^(\d)([\p{L}])`)
	qtyNoiseRe     = regexp.MustCompile(`(?i)^(?:ea\.|each|or more)\s+`)
	ofRe           = regexp.MustCompile(`(?i)^(?:of|the)\s+`)
)

// Parse rozebere jeden řádek. Nikdy neselže: co nepozná, zůstane v Name.
func (p *Parser) Parse(raw string) Line {
	l := Line{Raw: raw}
	s := strings.TrimSpace(raw)
	for r, v := range vulgar {
		// „1½“ → „1 1/2“
		s = regexp.MustCompile(`(\d)`+string(r)).ReplaceAllString(s, "$1 "+v)
		s = strings.ReplaceAll(s, string(r), v)
	}
	s = strings.TrimLeft(s, "-–*•· ")

	var notes []string
	s = inlineParensRe.ReplaceAllString(s, "$1$2") // „1 litr (červeného) vína“: přívlastek rozhoduje
	if m := parensRe.FindAllStringSubmatch(s, -1); m != nil {
		for _, x := range m {
			notes = append(notes, x[1])
		}
		s = strings.TrimSpace(parensRe.ReplaceAllString(s, ""))
	}
	if optRe.MatchString(raw) {
		l.Optional = true
		s = strings.TrimSpace(optRe.ReplaceAllString(s, ""))
	}
	taste := tasteRe.MatchString(s)
	s = strings.TrimSpace(tasteRe.ReplaceAllString(s, ""))

	s = p.takeQty(s, &l)
	s = p.takeUnit(s, &l)
	if m := commaRe.FindStringIndex(s); m != nil {
		notes = append([]string{strings.TrimSpace(s[m[0]+1:])}, notes...)
		s = s[:m[0]]
	}
	if m := orRe.FindStringIndex(s); m != nil {
		left, right := strings.TrimSpace(s[:m[0]]), strings.TrimSpace(s[m[1]:])
		if strings.Contains(s[m[0]:m[1]], "or") && !strings.Contains(left, " ") && strings.Contains(right, " ") {
			// „chicken or beef bouillon cubes“: hlava je společná a stojí vpravo.
			notes = append(notes, left)
			s = right
		} else {
			notes = append(notes, strings.TrimSpace(s[m[0]:]))
			s = left
		}
	}
	if taste {
		l.Qty, l.QtyMax = nil, nil
	}
	l.Name = strings.Trim(s, " .,;:-–")
	l.Note = strings.Trim(strings.Join(notes, "; "), " ;,")
	return l
}

func (p *Parser) takeQty(s string, l *Line) string {
	s = lettersRe.ReplaceAllString(s, "$1 $2") // „200g“ → „200 g“
	s = strings.TrimSpace(s)
	low := strings.ToLower(s)
	for _, w := range []string{"half a ", "half an "} {
		if strings.HasPrefix(low, w) {
			s = "1/2 " + s[len(w):]
			low = strings.ToLower(s)
		}
	}
	if first, rest, ok := strings.Cut(s, " "); ok {
		if v, known := words[strings.ToLower(first)]; known {
			if v == "" {
				return strings.TrimSpace(rest)
			}
			s = v + " " + rest
		}
	}
	m := qtyRe.FindStringSubmatch(s)
	if m == nil {
		return s
	}
	if v, ok := number(m[1]); ok {
		l.Qty = &v
	}
	if m[2] != "" {
		if v, ok := number(m[2]); ok {
			l.QtyMax = &v
		}
	}
	s = strings.TrimLeft(s[len(m[0]):], "-–— ") // „400g – eidam“
	return qtyNoiseRe.ReplaceAllString(s, "")
}

func (p *Parser) takeUnit(s string, l *Line) string {
	toks := strings.Fields(s)
	for n := min(p.maxLen, len(toks)); n >= 1; n-- {
		cand := strings.TrimRight(strings.ToLower(strings.Join(toks[:n], " ")), ".,")
		if id, ok := p.units[cand]; ok {
			l.Unit = id
			return ofRe.ReplaceAllString(strings.Join(toks[n:], " "), "")
		}
	}
	return s
}

func number(s string) (float64, bool) {
	s = strings.TrimSpace(strings.ReplaceAll(s, ",", "."))
	f := strings.Fields(s)
	if len(f) == 2 {
		a, ok1 := number(f[0])
		b, ok2 := number(f[1])
		return a + b, ok1 && ok2
	}
	if a, b, ok := strings.Cut(s, "/"); ok {
		x, err1 := strconv.ParseFloat(a, 64)
		y, err2 := strconv.ParseFloat(b, 64)
		if err1 != nil || err2 != nil || y == 0 {
			return 0, false
		}
		return x / y, true
	}
	v, err := strconv.ParseFloat(s, 64)
	return v, err == nil
}
