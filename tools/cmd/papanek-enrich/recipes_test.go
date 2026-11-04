package main

import (
	"strings"
	"testing"

	"github.com/lioilsources/papanek/tools/internal/content"
	"github.com/lioilsources/papanek/tools/internal/ontology"
)

func testGenerator(t *testing.T) *generator {
	t.Helper()
	units, err := ontology.LoadYAML[ontology.UnitsFile]("../../../seed/units.yaml")
	if err != nil {
		t.Fatal(err)
	}
	items, err := ontology.LoadYAML[[]ontology.Ingredient]("../../../seed/ingredients.yaml")
	if err != nil {
		t.Fatal(err)
	}
	return newGenerator(items, units, "", "")
}

func step(n int) []content.Step {
	s := make([]content.Step, n)
	for i := range s {
		s[i] = content.Step{Text: "krok"}
	}
	return s
}

func TestFix(t *testing.T) {
	g := testGenerator(t)
	q := 2.0
	r := content.Recipe{Difficulty: 1, PrepMin: 5, CookMin: 10, Servings: 2, Tags: []string{"quick", "nesmysl"},
		Ingredients: []content.RecipeLine{
			{Ingredient: "vejce", Qty: &q, Unit: "ks"}, // český název místo slugu → matcher
			{Ingredient: "salt"},
			{Ingredient: "salt"},
		},
		CS: content.Text{Title: "Vejce", Steps: step(3)}, EN: content.Text{Title: "Eggs", Steps: step(3)},
	}
	if p := g.fix(&r); len(p) > 0 {
		t.Fatalf("problémy: %v", p)
	}
	if len(r.Ingredients) != 2 || r.Ingredients[0].Ingredient != "egg" {
		t.Errorf("suroviny: %+v", r.Ingredients)
	}
	if strings.Join(r.Tags, ",") != "quick" {
		t.Errorf("tagy: %v", r.Tags)
	}

	bad := content.Recipe{Difficulty: 4, Servings: 1, PrepMin: 1,
		Ingredients: []content.RecipeLine{{Ingredient: "unicorn_dust"}, {Ingredient: "salt", Unit: "bucket"}},
		CS:          content.Text{Title: "X", Steps: step(3)}, EN: content.Text{Title: "X", Steps: step(4)}}
	p := strings.Join(g.fix(&bad), "|")
	for _, want := range []string{"difficulty", "unicorn_dust", "bucket", "počet kroků"} {
		if !strings.Contains(p, want) {
			t.Errorf("chybí problém %q v %s", want, p)
		}
	}
}

func TestExtractJSON(t *testing.T) {
	if got := extractJSON("<think>x</think>\n```json\n{\"a\":1}\n```"); got != `{"a":1}` {
		t.Errorf("got %q", got)
	}
	if slugify("Crêpes & Spring Rolls") != "crepes_spring_rolls" {
		t.Error(slugify("Crêpes & Spring Rolls"))
	}
}
