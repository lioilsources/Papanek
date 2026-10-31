package ingest

import (
	"reflect"
	"testing"
)

func TestParseRobots(t *testing.T) {
	got := ParseRobots("User-agent: Googlebot\nDisallow: /x\n\nUser-agent: *\nDisallow: /admin # c\nDisallow:\nAllow: /a\n\nUser-agent: Other\nDisallow: /y\n")
	if !reflect.DeepEqual(got, []string{"/admin"}) {
		t.Fatalf("got %v", got)
	}
}

func TestExtractSchemaOrg(t *testing.T) {
	page := `<html><script type="application/ld+json">{"@context":"https://schema.org","@graph":[
	{"@type":"WebPage"},
	{"@type":["Recipe"],"name":"Gul&aacute;&scaron;","image":"https://x/y.jpg","description":"cizí text",
	 "inLanguage":"cs-CZ","recipeCuisine":["Česká"],"prepTime":"PT15M","cookTime":"PT1H30M","recipeYield":"4 porce",
	 "recipeIngredient":["1 kg hovězí","2 cibule"],
	 "recipeInstructions":[{"@type":"HowToSection","itemListElement":[{"@type":"HowToStep","text":"Nakrájej."}]},{"@type":"HowToStep","text":"<b>Vař.</b>"}]}
	]}</script></html>`
	got := ExtractSchemaOrg("https://x/gulas", "unknown", []byte(page))
	if len(got) != 1 {
		t.Fatalf("recepty: %d", len(got))
	}
	want := RawRecipe{
		Source: "schemaorg", SourceURL: "https://x/gulas", SourceLicense: "unknown", Title: "Guláš", Lang: "cs",
		Cuisine: "Česká", PrepMin: 15, CookMin: 90, Servings: 4,
		Ingredients: []string{"1 kg hovězí", "2 cibule"}, Steps: []string{"Nakrájej.", "Vař."},
	}
	if !reflect.DeepEqual(got[0], want) {
		t.Fatalf("got %+v", got[0])
	}
}

func TestParseWikitext(t *testing.T) {
	wt := `{{recipesummary|Category=Italian recipes|Servings=4|Time=1 hour 20 minutes|Difficulty=2}}
{{recipe}}
Intro.
== Ingredients ==
=== Dough ===
* 500 [[Cookbook:Gram|g]] [[Cookbook:Flour|flour]]<ref>x</ref>
* '''2''' eggs {{note}}
{| class="wikitable"
| ignored
|}
== Procedure ==
# Mix [[Cookbook:Flour|flour]].
# Bake.
== Notes ==
* not an ingredient
[[Category:Italian recipes]]`
	got := ParseWikitext(Sites["en"], "Cookbook:Pizza Dough", wt)
	if got.Title != "Pizza Dough" || got.Cuisine != "Italian" || got.Servings != 4 || got.CookMin != 80 {
		t.Fatalf("meta: %+v", got)
	}
	if !reflect.DeepEqual(got.Ingredients, []string{"500 g flour", "2 eggs"}) {
		t.Fatalf("ingredients: %q", got.Ingredients)
	}
	if !reflect.DeepEqual(got.Steps, []string{"Mix flour.", "Bake."}) {
		t.Fatalf("steps: %q", got.Steps)
	}
	if got.SourceURL != "https://en.wikibooks.org/wiki/Cookbook:Pizza_Dough" || got.SourceLicense != WikibooksLicense {
		t.Fatalf("zdroj: %+v", got)
	}
}

func TestParseWikitextCzechInfobox(t *testing.T) {
	wt := `{{Infobox - recept
  | jméno = Smažený sýr
  | čas =
  | ingredience = '''pro 4 osoby:'''
* 400g – [[../Ingredience/Eidam|eidam]]
* 2 - 3 [[../Ingredience/Vejce|vejce]]
  | přílohy = [[../Hranolky|hranolky]]
}}

== Postup přípravy (4 porce) ==
Připravíme si mouku.

Smažíme dozlatova.
`
	got := ParseWikitext(Sites["cs"], "Wikikuchařka/Smažený sýr", wt)
	if got.Title != "Smažený sýr" || got.Servings != 4 {
		t.Fatalf("meta: %+v", got)
	}
	if !reflect.DeepEqual(got.Ingredients, []string{"400g – eidam", "2 - 3 vejce"}) {
		t.Fatalf("ingredients: %q", got.Ingredients)
	}
	if !reflect.DeepEqual(got.Steps, []string{"Připravíme si mouku.", "Smažíme dozlatova."}) {
		t.Fatalf("steps: %q", got.Steps)
	}
}

func TestParseWikitextCzechNoHeading(t *testing.T) {
	wt := "{{Infobox - recept\n | ingredience =\n* 3 vejce\n* 500 ml mléka\n}}\nVejce rozmícháme.\n"
	got := ParseWikitext(Sites["cs"], "Wikikuchařka/Palačinky", wt)
	if !reflect.DeepEqual(got.Steps, []string{"Vejce rozmícháme."}) {
		t.Fatalf("steps: %q", got.Steps)
	}
}
