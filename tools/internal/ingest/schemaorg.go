package ingest

import (
	"encoding/json"
	"html"
	"regexp"
	"strconv"
	"strings"
)

var ldJSONRe = regexp.MustCompile(`(?is)<script[^>]+application/ld\+json[^>]*>(.*?)</script>`)

// ExtractSchemaOrg najde v HTML všechny schema.org/Recipe a vrátí jen fakta.
// Záměrně nečte image, description ani recenze (§5: žádné cizí fotky a texty).
func ExtractSchemaOrg(pageURL, license string, page []byte) []RawRecipe {
	var out []RawRecipe
	for _, m := range ldJSONRe.FindAllSubmatch(page, -1) {
		var v any
		if json.Unmarshal(m[1], &v) != nil {
			continue
		}
		walk(v, func(n map[string]any) {
			r := RawRecipe{
				Source:        "schemaorg",
				SourceURL:     pageURL,
				SourceLicense: license,
				Title:         text(n["name"]),
				Lang:          strings.SplitN(text(n["inLanguage"]), "-", 2)[0],
				Cuisine:       firstText(n["recipeCuisine"]),
				PrepMin:       isoMinutes(text(n["prepTime"])),
				CookMin:       isoMinutes(text(n["cookTime"])),
				Servings:      leadingInt(firstText(n["recipeYield"])),
				Ingredients:   texts(n["recipeIngredient"]),
				Steps:         steps(n["recipeInstructions"]),
			}
			if len(r.Ingredients) == 0 {
				r.Ingredients = texts(n["ingredients"]) // starší forma schématu
			}
			if r.Usable() {
				out = append(out, r)
			}
		})
	}
	return out
}

func walk(v any, visit func(map[string]any)) {
	switch x := v.(type) {
	case []any:
		for _, e := range x {
			walk(e, visit)
		}
	case map[string]any:
		if isRecipe(x["@type"]) {
			visit(x)
		}
		walk(x["@graph"], visit)
		walk(x["mainEntity"], visit)
	}
}

func isRecipe(t any) bool {
	for _, s := range texts(t) {
		if strings.EqualFold(s, "Recipe") {
			return true
		}
	}
	return false
}

func text(v any) string {
	if s, ok := v.(string); ok {
		return clean(s)
	}
	if n, ok := v.(float64); ok {
		return strconv.FormatFloat(n, 'f', -1, 64)
	}
	return ""
}

func texts(v any) []string {
	switch x := v.(type) {
	case []any:
		var out []string
		for _, e := range x {
			if s := text(e); s != "" {
				out = append(out, s)
			}
		}
		return out
	default:
		if s := text(v); s != "" {
			return []string{s}
		}
	}
	return nil
}

func firstText(v any) string {
	if l := texts(v); len(l) > 0 {
		return l[0]
	}
	return ""
}

func steps(v any) []string {
	switch x := v.(type) {
	case string:
		var out []string
		for _, s := range strings.Split(x, "\n") {
			if s = clean(s); s != "" {
				out = append(out, s)
			}
		}
		return out
	case []any:
		var out []string
		for _, e := range x {
			out = append(out, steps(e)...)
		}
		return out
	case map[string]any: // HowToStep nebo HowToSection
		if sub, ok := x["itemListElement"]; ok {
			return steps(sub)
		}
		if s := text(x["text"]); s != "" {
			return []string{s}
		}
	}
	return nil
}

var (
	tagRe = regexp.MustCompile(`<[^>]*>`)
	isoRe = regexp.MustCompile(`^P(?:(\d+)D)?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:\d+S)?)?$`)
	intRe = regexp.MustCompile(`\d+`)
)

func clean(s string) string {
	return strings.Join(strings.Fields(html.UnescapeString(tagRe.ReplaceAllString(s, " "))), " ")
}

func isoMinutes(s string) int {
	m := isoRe.FindStringSubmatch(s)
	if m == nil {
		return 0
	}
	d, _ := strconv.Atoi(m[1])
	h, _ := strconv.Atoi(m[2])
	min, _ := strconv.Atoi(m[3])
	return d*1440 + h*60 + min
}

func leadingInt(s string) int {
	n, _ := strconv.Atoi(intRe.FindString(s))
	return n
}
