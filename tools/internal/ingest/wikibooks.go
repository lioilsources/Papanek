package ingest

import (
	"compress/bzip2"
	"encoding/xml"
	"io"
	"regexp"
	"strconv"
	"strings"
)

// WikibooksLicense je licence textů Wikibooks; pozor na ShareAlike u přepisů.
const WikibooksLicense = "CC BY-SA 4.0"

// WikiSite popisuje jednu jazykovou mutaci kuchařky.
type WikiSite struct {
	Lang, Host, Prefix string
	Ingredients, Steps []string // názvy sekcí, malými písmeny
}

// Sites: anglická Cookbook a česká Kuchařka.
var Sites = map[string]WikiSite{
	"en": {
		Lang: "en", Host: "en.wikibooks.org", Prefix: "Cookbook:",
		Ingredients: []string{"ingredients"},
		Steps:       []string{"procedure", "directions", "instructions", "method", "preparation"},
	},
	"cs": {
		Lang: "cs", Host: "cs.wikibooks.org", Prefix: "Wikikuchařka/",
		Ingredients: []string{"ingredience", "suroviny", "potřebujeme"},
		Steps:       []string{"postup", "příprava", "návod"},
	},
}

// ReadDump projde XML dump Wikimedia (.xml.bz2) a vrátí použitelné recepty.
// API (/w/) má robots.txt zakázané, dumpy jsou k hromadnému stahování určené.
func ReadDump(r io.Reader, s WikiSite) ([]RawRecipe, error) {
	dec := xml.NewDecoder(bzip2.NewReader(r))
	var out []RawRecipe
	for {
		tok, err := dec.Token()
		if err == io.EOF {
			return out, nil
		}
		if err != nil {
			return out, err
		}
		start, ok := tok.(xml.StartElement)
		if !ok || start.Name.Local != "page" {
			continue
		}
		var p struct {
			Title    string    `xml:"title"`
			Redirect *struct{} `xml:"redirect"`
			Text     string    `xml:"revision>text"`
		}
		if err := dec.DecodeElement(&p, &start); err != nil {
			return out, err
		}
		rest, found := strings.CutPrefix(p.Title, s.Prefix)
		// Podstránky (Wikikuchařka/Ingredience/…) nejsou recepty.
		if !found || p.Redirect != nil || strings.Contains(rest, "/") {
			continue
		}
		if rec := ParseWikitext(s, p.Title, p.Text); rec.Usable() {
			out = append(out, rec)
		}
	}
}

var (
	headingRe   = regexp.MustCompile(`^(={2,4})\s*(.+?)\s*={2,4}\s*$`)
	linkRe      = regexp.MustCompile(`\[\[(?:[^\]|]*\|)?([^\]]*)\]\]`)
	extLinkRe   = regexp.MustCompile(`\[https?://\S+\s*([^\]]*)\]`)
	templateRe  = regexp.MustCompile(`\{\{[^{}]*\}\}`)
	refRe       = regexp.MustCompile(`(?s)<ref[^>]*>.*?</ref>|<ref[^/]*/>`)
	quoteRe     = regexp.MustCompile(`'{2,}`)
	cuisineRe   = regexp.MustCompile(`(?i)\|\s*(?:cuisine|category)\s*=\s*([^|\n}]+)`)
	categoryRe  = regexp.MustCompile(`\[\[Category:([^\]|]+?) recipes`)
	servingsRe  = regexp.MustCompile(`(?i)\|\s*(?:servings|yield)\s*=\s*\D*(\d+)`)
	timeRe      = regexp.MustCompile(`(?i)\|\s*time\s*=\s*([^|\n}]+)`)
	hoursRe     = regexp.MustCompile(`(?i)(\d+)\s*(?:h|hours?|hod)`)
	minutesRe   = regexp.MustCompile(`(?i)(\d+)\s*(?:min)`)
	summaryName = regexp.MustCompile(`(?i)\|\s*(?:name|jméno)\s*=\s*([^|\n}]+)`)
	personsRe   = regexp.MustCompile(`(?i)\bpro (\d+) (?:osob|porc)|\((\d+) porc`)
	proseRe     = regexp.MustCompile(`^(?:\p{L}|\[\[\.\./)`) // ne obrázek, šablona ani kategorie
	infoParamRe = regexp.MustCompile(`^\|\s*([\p{L} ]+?)\s*=`)
)

// ParseWikitext vytáhne suroviny a kroky ze stránky. Řádky tabulek se přeskakují.
func ParseWikitext(s WikiSite, title, wt string) RawRecipe {
	r := RawRecipe{
		Source:        "wikibooks",
		SourceURL:     "https://" + s.Host + "/wiki/" + strings.ReplaceAll(title, " ", "_"),
		SourceLicense: WikibooksLicense,
		Title:         strings.TrimPrefix(title, s.Prefix),
		Lang:          s.Lang,
	}
	if m := cuisineRe.FindStringSubmatch(wt); m != nil {
		r.Cuisine = strings.TrimSuffix(strings.TrimSpace(m[1]), " recipes")
	}
	if m := categoryRe.FindStringSubmatch(wt); m != nil && r.Cuisine == "" {
		r.Cuisine = strings.TrimSpace(m[1])
	}
	if m := servingsRe.FindStringSubmatch(wt); m != nil {
		r.Servings, _ = strconv.Atoi(m[1])
	}
	if m := personsRe.FindStringSubmatch(wt); m != nil && r.Servings == 0 {
		r.Servings, _ = strconv.Atoi(m[1] + m[2])
	}
	if m := timeRe.FindStringSubmatch(wt); m != nil {
		r.CookMin = wikiMinutes(m[1])
	}
	if m := summaryName.FindStringSubmatch(wt); m != nil {
		r.Title = strings.TrimSpace(m[1])
	}
	section := ""
	for _, line := range strings.Split(refRe.ReplaceAllString(wt, ""), "\n") {
		if m := headingRe.FindStringSubmatch(line); m != nil {
			section = classify(s, m[2], section, len(m[1]))
			continue
		}
		t := strings.TrimSpace(line)
		// Česká Wikikuchařka má suroviny v parametru infoboxu, ne v sekci.
		if m := infoParamRe.FindStringSubmatch(t); m != nil {
			section = ""
			if strings.EqualFold(m[1], "ingredience") {
				section = "ing"
			}
			continue
		}
		// Za infoboxem bývá postup rovnou, bez nadpisu.
		if t == "}}" && s.Lang == "cs" && len(r.Ingredients) > 0 && len(r.Steps) == 0 {
			section = "step"
			continue
		}
		switch {
		case section == "ing" && strings.HasPrefix(t, "*"):
			if v := plain(strings.TrimLeft(t, "*: ")); v != "" {
				r.Ingredients = append(r.Ingredients, v)
			}
		case section == "step" && (strings.HasPrefix(t, "#") || strings.HasPrefix(t, "*")):
			if v := plain(strings.TrimLeft(t, "#*: ")); v != "" {
				r.Steps = append(r.Steps, v)
			}
		case section == "step" && s.Lang == "cs" && proseRe.MatchString(t):
			if v := plain(t); v != "" { // české postupy bývají souvislý text
				r.Steps = append(r.Steps, v)
			}
		}
	}
	return r
}

// classify drží podsekce („=== Dough ===“) uvnitř rodičovské sekce.
func classify(s WikiSite, heading, current string, level int) string {
	h := strings.ToLower(plain(heading))
	for _, n := range s.Ingredients {
		if strings.HasPrefix(h, n) {
			return "ing"
		}
	}
	for _, n := range s.Steps {
		if strings.HasPrefix(h, n) {
			return "step"
		}
	}
	if level > 2 {
		return current
	}
	return ""
}

func plain(s string) string {
	s = refRe.ReplaceAllString(s, "")
	for templateRe.MatchString(s) {
		s = templateRe.ReplaceAllString(s, "")
	}
	s = linkRe.ReplaceAllString(s, "$1")
	s = extLinkRe.ReplaceAllString(s, "$1")
	s = quoteRe.ReplaceAllString(s, "")
	return clean(s)
}

func wikiMinutes(s string) int {
	total := 0
	if m := hoursRe.FindStringSubmatch(s); m != nil {
		h, _ := strconv.Atoi(m[1])
		total += h * 60
	}
	if m := minutesRe.FindStringSubmatch(s); m != nil {
		n, _ := strconv.Atoi(m[1])
		total += n
	}
	return total
}
