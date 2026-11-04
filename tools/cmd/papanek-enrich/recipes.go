package main

// recipes píše recepty od nuly podle seznamu jídel (plán §5: žádný cizí text).
// Výstup je jeden YAML na recept v seed/recipes/<pack>/, aby šel číst a opravit
// v gitu. Už hotové soubory přeskakuje, takže běh jde po odsunutí pustit znovu.
//
//	sparkctl exec papanek qwen36 120 15 "recepty" --dir tools -- \
//	  go run ./cmd/papanek-enrich recipes -list ../seed/free50.yaml -pack free

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"log"
	"log/slog"
	"net/http"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"sync"
	"time"

	"gopkg.in/yaml.v3"

	"github.com/lioilsources/papanek/tools/internal/content"
	"github.com/lioilsources/papanek/tools/internal/ontology"
)

type dish struct {
	CS    string `yaml:"cs"`
	EN    string `yaml:"en"`
	Level int    `yaml:"level"`
}

var allowedTags = []string{"vegetarian", "vegan", "quick", "one_pot", "soup", "main", "side", "dessert",
	"breakfast", "snack", "kids", "budget", "baking", "no_oven", "spicy", "meal_prep"}

const systemPrompt = `Jsi autor kuchařky pro úplné začátečníky. Píšeš vlastní recepty od nuly, nikdy necituješ cizí texty.
Pravidla:
- Kroky krátké, jeden úkon na krok, 5–12 kroků. Vysvětli, jak poznat, že je hotovo (barva, vůně, konzistence).
- Žádné odborné výrazy bez vysvětlení. Bezpečnost: maso propečené, horký olej, nůž.
- Množství pro uvedený počet porcí, realistická, v gramech, ml nebo kusech.
- Suroviny vybírej POUZE ze seznamu (pole "ingredient" = přesně slug ze seznamu). Sůl, pepř a olej uveď taky.
- Jednotka "unit" POUZE z: %s. Bez množství (podle chuti) dej qty null a unit "".
- timer_sec vyplň u kroků, kde se na něco čeká (vaření, pečení, odpočinek), jinak 0.
- tags vyber jen z: %s.
- Česká verze je přirozená, gramaticky správná čeština (ne překlad). Čtenáři VŽDY tykej v rozkazovacím způsobu (nakrájej, osmahni, vař), nikdy nevykej.
- Anglická verze je přirozená angličtina. Obsah obou verzí se shoduje krok po kroku.
- note_cs/note_en jen když přidávají informaci (např. „nakrájená na kostičky“). „Podle chuti“ do poznámky nepiš.
- tips: 1–2 krátké konkrétní rady, které si neodporují s postupem.
- image_prompt: anglicky, jedna věta, jak jídlo vypadá na talíři, bez stylu a bez textu.
Odpověz jen JSON objektem:
{"difficulty":1-3,"prep_min":int,"cook_min":int,"servings":int,"tags":[...],"image_prompt":"...",
 "ingredients":[{"ingredient":"slug","qty":number|null,"unit":"id","optional":bool,"note_cs":"","note_en":""}],
 "cs":{"title":"","summary":"1–2 věty","steps":[{"text":"","timer_sec":0}],"tips":"1–3 rady"},
 "en":{"title":"","summary":"","steps":[{"text":"","timer_sec":0}],"tips":""}}

Seznam surovin (slug: český název):
%s`

func recipesCmd(args []string) {
	fs := flag.NewFlagSet("recipes", flag.ExitOnError)
	list := fs.String("list", "../seed/free50.yaml", "seznam jídel podle kuchyní")
	pack := fs.String("pack", "free", "id balíčku")
	seed := fs.String("seed", "../seed", "adresář seedu")
	llm := fs.String("llm", sparkURL(8080, "/v1"), "OpenAI API brány (výchozí z SPARK_HOST)")
	model := fs.String("model", "bench-qwen36", "alias modelu (bez fallbacku)")
	workers := fs.Int("workers", 4, "souběžné dotazy")
	only := fs.String("only", "", "jen jídla, jejichž anglický název obsahuje tento text")
	_ = fs.Parse(args)
	if *llm == "" {
		log.Fatal("chybí adresa SPARKu: nastav SPARK_HOST (viz .env.example) nebo -llm")
	}

	units, err := ontology.LoadYAML[ontology.UnitsFile](filepath.Join(*seed, "units.yaml"))
	if err != nil {
		log.Fatal(err)
	}
	items, err := ontology.LoadYAML[[]ontology.Ingredient](filepath.Join(*seed, "ingredients.yaml"))
	if err != nil {
		log.Fatal(err)
	}
	menu, err := ontology.LoadYAML[map[string][]dish](*list)
	if err != nil {
		log.Fatal(err)
	}
	g := newGenerator(items, units, *llm, *model)
	outDir := filepath.Join(*seed, "recipes", *pack)
	if err := os.MkdirAll(outDir, 0o755); err != nil {
		log.Fatal(err)
	}

	type job struct {
		cuisine string
		d       dish
	}
	var jobs []job
	cuisines := make([]string, 0, len(menu))
	for c := range menu {
		cuisines = append(cuisines, c)
	}
	sort.Strings(cuisines)
	for _, c := range cuisines {
		for _, d := range menu[c] {
			if *only == "" || strings.Contains(strings.ToLower(d.EN), strings.ToLower(*only)) {
				jobs = append(jobs, job{c, d})
			}
		}
	}

	var mu sync.Mutex
	ok, failed, skipped := 0, 0, 0
	ch := make(chan job)
	var wg sync.WaitGroup
	for range *workers {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for j := range ch {
				slug := slugify(j.d.EN)
				path := filepath.Join(outDir, slug+".yaml")
				if _, err := os.Stat(path); err == nil {
					mu.Lock()
					skipped++
					mu.Unlock()
					continue
				}
				r, err := g.write(j.d, j.cuisine)
				mu.Lock()
				if err != nil {
					slog.Error("recept selhal", "slug", slug, "err", err)
					failed++
				} else {
					r.Slug, r.Pack, r.Cuisine = slug, *pack, j.cuisine
					if err = saveYAML(path, r); err != nil {
						slog.Error("recept selhal", "slug", slug, "err", err)
						failed++
					} else {
						slog.Info("recept hotov", "slug", slug, "surovin", len(r.Ingredients), "kroku", len(r.CS.Steps), "model", r.Model)
						ok++
					}
				}
				mu.Unlock()
			}
		}()
	}
	for _, j := range jobs {
		ch <- j
	}
	close(ch)
	wg.Wait()
	slog.Info("hotovo", "nove", ok, "preskoceno", skipped, "chyby", failed)
	fmt.Printf(`{"recipes":{"ok":%d,"failed":%d}}`+"\n", ok+skipped, failed)
	if failed > 0 {
		os.Exit(1)
	}
}

type generator struct {
	llm, model string
	system     string
	slugs      map[string]bool
	units      map[string]bool
	cs         *ontology.Matcher
	client     *http.Client
}

func newGenerator(items []ontology.Ingredient, units ontology.UnitsFile, llm, model string) *generator {
	g := &generator{llm: llm, model: model, slugs: map[string]bool{}, units: map[string]bool{},
		cs: ontology.NewMatcher(items, "cs"), client: &http.Client{Timeout: 6 * time.Minute}}
	var lines []string
	for _, in := range items {
		g.slugs[in.Slug] = true
		lines = append(lines, in.Slug+": "+in.CS)
	}
	var uids []string
	for _, u := range units.Units {
		g.units[u.ID] = true
		uids = append(uids, u.ID)
	}
	g.system = fmt.Sprintf(systemPrompt, strings.Join(uids, ", "), strings.Join(allowedTags, ", "), strings.Join(lines, "\n"))
	return g
}

// write zkusí recept třikrát; chyby kontroly vrací modelu jako opravu.
func (g *generator) write(d dish, cuisine string) (*content.Recipe, error) {
	msgs := []map[string]string{
		{"role": "system", "content": g.system},
		{"role": "user", "content": fmt.Sprintf("Napiš recept: %s (%s). Kuchyně: %s. Náročnost pro začátečníka: %d z 3. Porce: 4, pokud se k jídlu nehodí jiný počet.",
			d.CS, d.EN, cuisine, d.Level)},
	}
	var lastErr error
	for attempt := 1; attempt <= 3; attempt++ {
		raw, used, err := g.chat(msgs)
		if err != nil {
			lastErr = err
			time.Sleep(10 * time.Second)
			continue
		}
		var r content.Recipe
		if err := json.Unmarshal([]byte(extractJSON(raw)), &r); err != nil {
			lastErr = fmt.Errorf("JSON: %w", err)
		} else if probs := g.fix(&r); len(probs) > 0 {
			lastErr = fmt.Errorf("kontrola: %s", strings.Join(probs, "; "))
		} else {
			r.Model = used
			if fixed, err := g.review(&r); err != nil {
				slog.Warn("redakce selhala, nechávám první verzi", "jidlo", d.EN, "err", err)
			} else {
				fixed.Model = used
				return fixed, nil
			}
			return &r, nil
		}
		msgs = append(msgs, map[string]string{"role": "assistant", "content": raw},
			map[string]string{"role": "user", "content": "Oprav a pošli celý JSON znovu. Problémy: " + lastErr.Error()})
	}
	return nil, lastErr
}

const reviewPrompt = `Jsi přísný redaktor kuchařky pro začátečníky. Zkontroluj recept a oprav:
- českou gramatiku a překlepy; čtenáři se všude tyká (nakrájej, vař), nikde vykání,
- věcné a logické chyby (pořadí kroků, časy, teploty, množství, kroky, které si odporují),
- bezpečnost (propečení masa, horký olej),
- aby česká a anglická verze říkaly totéž a měly stejný počet kroků.
Slugy surovin a jednotky neměň. Vrať jen celý opravený JSON ve stejném tvaru.`

// review je druhé kolo: redakce textu. Výsledek musí znovu projít kontrolou.
func (g *generator) review(r *content.Recipe) (*content.Recipe, error) {
	in, _ := json.Marshal(r)
	raw, _, err := g.chat([]map[string]string{
		{"role": "system", "content": reviewPrompt},
		{"role": "user", "content": string(in)},
	})
	if err != nil {
		return nil, err
	}
	var out content.Recipe
	if err := json.Unmarshal([]byte(extractJSON(raw)), &out); err != nil {
		return nil, fmt.Errorf("JSON: %w", err)
	}
	if probs := g.fix(&out); len(probs) > 0 {
		return nil, fmt.Errorf("kontrola: %s", strings.Join(probs, "; "))
	}
	return &out, nil
}

// fix opraví, co jde bez modelu (slug přes český matcher), a vrátí zbylé problémy.
func (g *generator) fix(r *content.Recipe) []string {
	var p []string
	if r.Difficulty < 1 || r.Difficulty > 3 {
		p = append(p, "difficulty mimo 1–3")
	}
	if r.Servings < 1 || r.PrepMin < 0 || r.CookMin < 0 || r.PrepMin+r.CookMin == 0 {
		p = append(p, "neplatné porce nebo časy")
	}
	if len(r.Ingredients) < 2 {
		p = append(p, "málo surovin")
	}
	seen := map[string]bool{}
	var lines []content.RecipeLine
	for _, l := range r.Ingredients {
		if !g.slugs[l.Ingredient] {
			if m := g.cs.Find(strings.ReplaceAll(l.Ingredient, "_", " ")); m.Automatic() {
				l.Ingredient = m.Slug
			} else {
				p = append(p, fmt.Sprintf("surovina %q není v seznamu, vyber nejbližší slug", l.Ingredient))
				continue
			}
		}
		if seen[l.Ingredient] {
			continue // stejná surovina dvakrát: PK v content.db ji nepustí
		}
		seen[l.Ingredient] = true
		if l.Unit != "" && !g.units[l.Unit] {
			p = append(p, fmt.Sprintf("jednotka %q není povolená", l.Unit))
		}
		if l.Qty != nil && *l.Qty <= 0 {
			l.Qty = nil
		}
		lines = append(lines, l)
	}
	r.Ingredients = lines
	for lang, t := range map[string]content.Text{"cs": r.CS, "en": r.EN} {
		if t.Title == "" || len(t.Steps) < 3 {
			p = append(p, lang+": chybí název nebo kroky")
		}
		for _, s := range t.Steps {
			if strings.TrimSpace(s.Text) == "" || s.TimerSec < 0 {
				p = append(p, lang+": prázdný krok")
				break
			}
		}
	}
	if len(r.CS.Steps) != len(r.EN.Steps) {
		p = append(p, "cs a en mají různý počet kroků")
	}
	ok := map[string]bool{}
	for _, t := range allowedTags {
		ok[t] = true
	}
	var tags []string
	for _, t := range r.Tags {
		if ok[t] {
			tags = append(tags, t)
		}
	}
	r.Tags = tags
	return p
}

func (g *generator) chat(msgs []map[string]string) (string, string, error) {
	body, _ := json.Marshal(map[string]any{
		"model": g.model, "messages": msgs, "temperature": 0.4, "max_tokens": 6000,
		"response_format": map[string]string{"type": "json_object"},
	})
	resp, err := g.client.Post(g.llm+"/chat/completions", "application/json", bytes.NewReader(body))
	if err != nil {
		return "", "", err
	}
	defer resp.Body.Close()
	raw, _ := io.ReadAll(resp.Body)
	if resp.StatusCode != http.StatusOK {
		return "", "", fmt.Errorf("HTTP %d: %.200s", resp.StatusCode, raw)
	}
	var out struct {
		Model   string `json:"model"`
		Choices []struct {
			Message struct {
				Content string `json:"content"`
			} `json:"message"`
			FinishReason string `json:"finish_reason"`
		} `json:"choices"`
	}
	if err := json.Unmarshal(raw, &out); err != nil || len(out.Choices) == 0 {
		return "", "", fmt.Errorf("odpověď: %.200s", raw)
	}
	if out.Choices[0].FinishReason == "length" {
		return "", "", fmt.Errorf("odpověď useknutá (max_tokens)")
	}
	return out.Choices[0].Message.Content, out.Model, nil
}

func extractJSON(s string) string {
	if i := strings.Index(s, "</think>"); i >= 0 {
		s = s[i+len("</think>"):]
	}
	a, b := strings.Index(s, "{"), strings.LastIndex(s, "}")
	if a < 0 || b < a {
		return s
	}
	return s[a : b+1]
}

func slugify(s string) string {
	n := ontology.Normalize(s)
	return strings.ReplaceAll(n, " ", "_")
}

func saveYAML(path string, v any) error {
	var buf bytes.Buffer
	enc := yaml.NewEncoder(&buf)
	enc.SetIndent(2)
	if err := enc.Encode(v); err != nil {
		return err
	}
	tmp := path + ".tmp"
	if err := os.WriteFile(tmp, buf.Bytes(), 0o644); err != nil {
		return err
	}
	return os.Rename(tmp, path)
}
