// Package ontology načítá seed surovin a jednotek (plán §6, §7).
package ontology

import (
	"fmt"
	"os"
	"sort"
	"strings"
	"unicode"

	"golang.org/x/text/runes"
	"golang.org/x/text/transform"
	"golang.org/x/text/unicode/norm"
	"gopkg.in/yaml.v3"
)

// Categories je uzavřený výčet kategorií; drží seskupení ve spíži a v nákupu.
var Categories = map[string]bool{
	"zelenina": true, "ovoce": true, "houby": true, "cerstve_bylinky": true,
	"maso": true, "uzeniny": true, "ryby": true, "mlecne": true, "vejce": true, "rostlinne_bilkoviny": true,
	"obiloviny": true, "mouka": true, "testoviny": true, "pecivo": true, "lusteniny": true,
	"orechy_seminka": true, "susene_plody": true,
	"koreni": true, "oleje_tuky": true, "ocet_omacky": true, "sladidla": true, "konzervy": true, "napoje": true,
}

// Allergens je výčet 14 alergenů EU; překlep tu nesmí tiše projít filtrem.
var Allergens = map[string]bool{
	"celer": true, "horcice": true, "skorapkove_plody": true, "siry": true, "lupina": true, "soja": true,
	"arasidy": true, "sezam": true, "lepek": true, "mleko": true, "vejce": true, "ryby": true,
	"korysi": true, "mekkysi": true,
}

// Ingredient je jedna položka seed/ingredients.yaml.
type Ingredient struct {
	Slug          string   `yaml:"slug"`
	CS            string   `yaml:"cs"`
	EN            string   `yaml:"en"`
	Category      string   `yaml:"cat"`
	Unit          string   `yaml:"unit"`
	GramsPerPiece float64  `yaml:"gpp,omitempty"`
	ShelfDays     *int     `yaml:"shelf,omitempty"`
	Staple        bool     `yaml:"staple,omitempty"`
	Allergens     []string `yaml:"allergens,omitempty"`
	AliasesCS     []string `yaml:"al_cs"`
	AliasesEN     []string `yaml:"al_en"`
}

// Unit je jedna položka seed/units.yaml.
type Unit struct {
	ID      string   `yaml:"id"`
	Name    string   `yaml:"name"`
	Kind    string   `yaml:"kind"`
	Aliases []string `yaml:"aliases"`
}

// Conversion je obecná konverze jednotek.
type Conversion struct {
	From   string  `yaml:"from"`
	To     string  `yaml:"to"`
	Factor float64 `yaml:"factor"`
}

// UnitsFile je obsah seed/units.yaml.
type UnitsFile struct {
	Units       []Unit       `yaml:"units"`
	Conversions []Conversion `yaml:"conversions"`
}

// Pack je jedna položka seed/packs.yaml.
type Pack struct {
	ID      string `yaml:"id"`
	NameCS  string `yaml:"cs"`
	NameEN  string `yaml:"en"`
	Product string `yaml:"product,omitempty"`
	Target  int    `yaml:"target"`
}

// LoadYAML načte libovolný seed soubor.
func LoadYAML[T any](path string) (T, error) {
	var v T
	b, err := os.ReadFile(path)
	if err != nil {
		return v, err
	}
	dec := yaml.NewDecoder(strings.NewReader(string(b)))
	dec.KnownFields(true)
	if err := dec.Decode(&v); err != nil {
		return v, fmt.Errorf("%s: %w", path, err)
	}
	return v, nil
}

// Validate vrátí všechny problémy seedu. Prázdný výsledek = seed je použitelný.
// Sdílený alias mezi dvěma surovinami je chyba: matcher by volil náhodně.
func Validate(items []Ingredient, units UnitsFile) []string {
	var errs []string
	known := map[string]bool{}
	for _, u := range units.Units {
		known[u.ID] = true
	}
	slugs := map[string]bool{}
	type key struct{ alias, lang string }
	owner := map[key]string{}
	addAlias := func(slug, lang, alias string) {
		k := key{strings.ToLower(alias), lang}
		if prev, ok := owner[k]; ok && prev != slug {
			errs = append(errs, fmt.Sprintf("alias %q (%s): %s i %s", alias, lang, prev, slug))
			return
		}
		owner[k] = slug
	}
	for _, in := range items {
		if slugs[in.Slug] {
			errs = append(errs, "duplicitní slug "+in.Slug)
		}
		slugs[in.Slug] = true
		if in.CS == "" || in.EN == "" {
			errs = append(errs, in.Slug+": chybí název")
		}
		if !Categories[in.Category] {
			errs = append(errs, fmt.Sprintf("%s: neznámá kategorie %q", in.Slug, in.Category))
		}
		if !known[in.Unit] {
			errs = append(errs, fmt.Sprintf("%s: neznámá jednotka %q", in.Slug, in.Unit))
		}
		for _, a := range in.Allergens {
			if !Allergens[a] {
				errs = append(errs, fmt.Sprintf("%s: neznámý alergen %q", in.Slug, a))
			}
		}
		for _, a := range in.AliasesCS {
			addAlias(in.Slug, "cs", a)
		}
		for _, a := range in.AliasesEN {
			addAlias(in.Slug, "en", a)
		}
	}
	sort.Strings(errs)
	return errs
}

// tokens rozdělí text na malá slova; diakritika zůstává.
func tokens(s string) []string {
	return strings.FieldsFunc(strings.ToLower(s), func(r rune) bool {
		return !unicode.IsLetter(r) && !unicode.IsDigit(r) && !unicode.Is(unicode.Mn, r)
	})
}

// Normalize sjednotí text pro porovnání: malá písmena, bez diakritiky, jedna mezera.
func Normalize(s string) string {
	t := transform.Chain(norm.NFD, runes.Remove(runes.In(unicode.Mn)), norm.NFC)
	out, _, err := transform.String(t, strings.ToLower(s))
	if err != nil {
		out = strings.ToLower(s)
	}
	return strings.Join(strings.FieldsFunc(out, func(r rune) bool {
		return !unicode.IsLetter(r) && !unicode.IsDigit(r)
	}), " ")
}
