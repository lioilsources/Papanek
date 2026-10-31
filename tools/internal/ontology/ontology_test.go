package ontology

import (
	"os"
	"strings"
	"testing"
)

func TestDiacriticsKeepIngredientsApart(t *testing.T) {
	items := []Ingredient{
		{Slug: "muesli", AliasesCS: []string{"müsli"}},
		{Slug: "mussels", AliasesCS: []string{"mušlí"}},
		{Slug: "garlic", AliasesCS: []string{"česnek"}},
	}
	m := NewMatcher(items, "cs")
	for in, want := range map[string]string{"müsli": "muesli", "mušlí": "mussels", "cesnek": "garlic", "musli": ""} {
		if got := m.Find(in); got.Slug != want {
			t.Errorf("%q → %q, chci %q", in, got.Slug, want)
		}
	}
}

func TestEnglishHeadNoun(t *testing.T) {
	items := []Ingredient{{Slug: "tomato", AliasesEN: []string{"tomato"}}, {Slug: "oil", AliasesEN: []string{"oil"}}}
	m := NewMatcher(items, "en")
	if got := m.Find("tomato sauce"); got.Automatic() {
		t.Errorf("tomato sauce nesmí projít automaticky: %+v", got)
	}
	if got := m.Find("ripe tomato"); got.Slug != "tomato" || !got.Automatic() {
		t.Errorf("ripe tomato: %+v", got)
	}
}

// Podlaha pro krok 2 z §7 (bez embeddingů a LLM). Cíl M0 je 95 %. final200 je
// náhodný vzorek, na kterém se nic neladilo; hlídá regresi, nedokazuje cíl.
func TestCoverageFloor(t *testing.T) {
	const floor = 88.0
	if pct := coverage(t, "testdata/final200.tsv"); pct < floor {
		t.Fatalf("pokrytí %.1f %% < %.1f %%", pct, floor)
	}
}

// coverage bere názvy přes jednoduchý řez, parser má vlastní testy a importoval by nás.
func coverage(t *testing.T, path string) float64 {
	t.Helper()
	items, err := LoadYAML[[]Ingredient]("../../../seed/ingredients.yaml")
	if err != nil {
		t.Fatal(err)
	}
	b, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	m := map[string]*Matcher{"cs": NewMatcher(items, "cs"), "en": NewMatcher(items, "en")}
	total, auto := 0, 0
	for _, l := range strings.Split(strings.TrimSpace(string(b)), "\n") {
		lang, line, _ := strings.Cut(l, "\t")
		name, _, _ := strings.Cut(line, ",")
		total++
		if m[lang].Find(name).Automatic() {
			auto++
		}
	}
	return 100 * float64(auto) / float64(total)
}
