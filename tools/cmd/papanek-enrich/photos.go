package main

// photos píše zadání fotek (JSONL) pro run_photos.py na L40S: hotové jídlo, každý krok
// postupu, každá surovina a každý nástroj. Fotky nahradily komiks (Ol1n 16. 11. 2026),
// komiks zůstává jako volitelný styl.
//
//	go run ./cmd/papanek-enrich photos -out ../out/photo_jobs.jsonl
//	rsync ../out/photo_jobs.jsonl tcloud:/srv/work/papanek/ && ssh tcloud python3 run_photos.py …

import (
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/lioilsources/papanek/tools/internal/content"
	"github.com/lioilsources/papanek/tools/internal/ontology"
)

// Fotografický styl pro celou appku: přirozené světlo, domácí kuchyně, žádný text.
const photoStyle = "professional food photography, photorealistic, natural soft window light, " +
	"shallow depth of field, 50mm lens, true-to-life colours, realistic textures, high detail, " +
	"no text, no letters, no labels, no watermark"

const studioStyle = "studio product photograph, photorealistic, centered, the whole object visible with some margin, " +
	"isolated on a seamless plain warm white background, soft diffused light, gentle natural shadow, sharp focus, " +
	"no text, no letters, no labels, no packaging, no watermark"

type photoJob struct {
	Name   string `json:"name"`  // relativní cesta bez přípony: hero/<slug>, step/<slug>_02, ing/<slug>, tool/<slug>
	Model  string `json:"model"` // qwen | schnell
	Prompt string `json:"prompt"`
	Seed   int64  `json:"seed"`
}

type tool struct {
	Slug  string   `yaml:"slug"`
	CS    string   `yaml:"cs"`
	EN    string   `yaml:"en"`
	Match []string `yaml:"match"`
	Photo string   `yaml:"photo"`
}

func photosCmd(args []string) {
	fs := flag.NewFlagSet("photos", flag.ExitOnError)
	dir := fs.String("recipes", "../seed/recipes", "adresář receptů")
	ingFile := fs.String("ingredients", "../seed/ingredients.yaml", "ontologie surovin")
	toolFile := fs.String("tools", "../seed/tools.yaml", "katalog nástrojů")
	out := fs.String("out", "../out/photo_jobs.jsonl", "výstup JSONL")
	dishModel := fs.String("dish-model", "qwen", "model pro jídla a kroky (qwen|schnell)")
	itemModel := fs.String("item-model", "schnell", "model pro suroviny a nástroje")
	_ = fs.Parse(args)

	var jobs []photoJob
	files, _ := filepath.Glob(filepath.Join(*dir, "*", "*.yaml"))
	for _, f := range files {
		r, err := ontology.LoadYAML[content.Recipe](f)
		if err != nil {
			log.Fatalf("%s: %v", f, err)
		}
		jobs = append(jobs, photoJob{"hero/" + r.Slug, *dishModel, heroPhotoPrompt(r), seedFor(r.Slug)})
		for i, s := range r.EN.Steps {
			name := fmt.Sprintf("step/%s_%02d", r.Slug, i+1)
			jobs = append(jobs, photoJob{name, *dishModel, stepPhotoPrompt(r, i, s.Text), seedFor(name)})
		}
	}
	ings, err := ontology.LoadYAML[[]ontology.Ingredient](*ingFile)
	if err != nil {
		log.Fatal(err)
	}
	for _, in := range ings {
		p := "a photo of " + in.EN + " as a cooking ingredient, a typical home-cooking amount as bought in a grocery store, fresh and appetising, " + studioStyle
		jobs = append(jobs, photoJob{"ing/" + in.Slug, *itemModel, p, seedFor("ing/" + in.Slug)})
	}
	tools, err := ontology.LoadYAML[[]tool](*toolFile)
	if err != nil {
		log.Fatal(err)
	}
	for _, t := range tools {
		p := "a photo of " + t.Photo + ", a kitchen utensil, clean and new, " + studioStyle
		jobs = append(jobs, photoJob{"tool/" + t.Slug, *itemModel, p, seedFor("tool/" + t.Slug)})
	}

	if err := os.MkdirAll(filepath.Dir(*out), 0o755); err != nil {
		log.Fatal(err)
	}
	f, err := os.Create(*out)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	enc := json.NewEncoder(f)
	for _, j := range jobs {
		if err := enc.Encode(j); err != nil {
			log.Fatal(err)
		}
	}
	fmt.Printf(`{"photo_jobs":%d}`+"\n", len(jobs))
}

func heroPhotoPrompt(r content.Recipe) string {
	p := strings.TrimSuffix(strings.TrimSpace(r.ImagePrompt), ".")
	if p == "" {
		p = "a plate of " + r.EN.Title
	}
	return "A photo of the finished dish " + r.EN.Title + ": " + p + hints(p+" "+r.EN.Title) +
		". Served at home on a wooden kitchen table, seen from slightly above, " + photoStyle
}

// stepPhotoPrompt popisuje jeden krok jako fotku z domácí kuchyně: ruce kuchaře, suroviny a
// nádobí z kroku, jídlo v rozpracovaném stavu.
func stepPhotoPrompt(r content.Recipe, i int, text string) string {
	return fmt.Sprintf("A photo of cooking step %d of %d while making %s at home: %s"+
		" Show exactly this moment: the cook's hands, the food in its current half-prepared state and the kitchen tools used,"+
		" on a home kitchen counter or stove, close-up from the cook's point of view. %s",
		i+1, len(r.EN.Steps), r.EN.Title, ensureDot(text)+hints(text+" "+r.EN.Title), photoStyle)
}

func hints(s string) string {
	low := strings.ToLower(s)
	var out string
	for k, h := range dishHints {
		if strings.Contains(low, k) {
			out += " (" + h + ")"
		}
	}
	return out
}

func ensureDot(s string) string {
	s = strings.TrimSpace(s)
	if strings.HasSuffix(s, ".") {
		return s
	}
	return s + "."
}
