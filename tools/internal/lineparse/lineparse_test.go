package lineparse

import (
	"testing"

	"github.com/lioilsources/papanek/tools/internal/ontology"
)

func parser(t *testing.T) *Parser {
	t.Helper()
	u, err := ontology.LoadYAML[ontology.UnitsFile]("../../../seed/units.yaml")
	if err != nil {
		t.Fatal(err)
	}
	return New(u.Units)
}

func TestParse(t *testing.T) {
	p := parser(t)
	cases := []struct {
		in, unit, name, note string
		qty, max             float64 // 0 = nil
		optional             bool
	}{
		{in: "2 velké cibule, nakrájené", qty: 2, name: "velké cibule", note: "nakrájené"},
		{in: "1/2 lžičky soli", qty: 0.5, unit: "lzicka", name: "soli"},
		{in: "1-2 stroužky česneku", qty: 1, max: 2, unit: "strouzek", name: "česneku"},
		{in: "1,5 dl mléka", qty: 1.5, unit: "dl", name: "mléka"},
		{in: "200g hladké mouky", qty: 200, unit: "g", name: "hladké mouky"},
		{in: "1 1/2 cups all-purpose flour", qty: 1.5, unit: "hrnek", name: "all-purpose flour"},
		{in: "½ cup sugar", qty: 0.5, unit: "hrnek", name: "sugar"},
		{in: "1½ tsp salt", qty: 1.5, unit: "lzicka", name: "salt"},
		{in: "2 (14 oz) cans diced tomatoes", qty: 2, unit: "plechovka", name: "diced tomatoes", note: "14 oz"},
		{in: "a pinch of nutmeg", qty: 1, unit: "stipka", name: "nutmeg"},
		{in: "two tablespoons of olive oil", qty: 2, unit: "lzice", name: "olive oil"},
		{in: "salt to taste", name: "salt"},
		{in: "sůl podle chuti", name: "sůl"},
		{in: "1 tbsp butter or margarine", qty: 1, unit: "lzice", name: "butter", note: "or margarine"},
		{in: "1 cup cream (optional)", qty: 1, unit: "hrnek", name: "cream", note: "optional", optional: true},
		{in: "špetka soli", qty: 0, unit: "stipka", name: "soli"},
		{in: "2 chicken or beef bouillon cubes", qty: 2, name: "beef bouillon cubes", note: "chicken"},
		{in: "1 litr (červeného) vína", qty: 1, unit: "l", name: "červeného vína"},
		{in: "4 ea. eggs", qty: 4, name: "eggs"},
		{in: "3 cl světlého rumu", qty: 3, unit: "cl", name: "světlého rumu"},
		{in: "půl citronu", qty: 0.5, name: "citronu"},
	}
	for _, c := range cases {
		got := p.Parse(c.in)
		if got.Name != c.name || got.Unit != c.unit || got.Note != c.note || got.Optional != c.optional {
			t.Errorf("%q: name=%q unit=%q note=%q opt=%v", c.in, got.Name, got.Unit, got.Note, got.Optional)
		}
		check := func(label string, want float64, have *float64) {
			if (want == 0) != (have == nil) || (have != nil && *have != want) {
				t.Errorf("%q: %s = %v, chci %v", c.in, label, have, want)
			}
		}
		check("qty", c.qty, got.Qty)
		check("max", c.max, got.QtyMax)
	}
}
