package main

// images kreslí hero obrázky receptů ve stylu, který Ol1n vybral 2. 11. 2026
// (flat-komiks, §10). Hotové obrázky přeskakuje. Spouštět přes broker:
//
//	sparkctl exec papanek comfyui 60 15 "obrázky" --dir tools -- \
//	  go run ./cmd/papanek-enrich images -recipes ../seed/recipes -out ../app/assets/images

import (
	"flag"
	"fmt"
	"hash/fnv"
	"log"
	"log/slog"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/lioilsources/papanek/tools/internal/content"
	"github.com/lioilsources/papanek/tools/internal/ontology"
)

// Upřesnění pro jídla, která flux kreslí špatně (ukázky stylů: knedlíky jako brambory).
var dishHints = map[string]string{
	"dumpling": "Czech bread dumplings are thick round slices of white fluffy steamed bread with an airy crumb, not potatoes",
	"goulash":  "dark brown paprika beef stew with chunks of beef",
}

func imagesCmd(args []string) {
	fs := flag.NewFlagSet("images", flag.ExitOnError)
	dir := fs.String("recipes", "../seed/recipes", "adresář receptů")
	comfy := fs.String("comfy", sparkURL(8188, ""), "ComfyUI (výchozí z SPARK_HOST)")
	out := fs.String("out", "../app/assets/images", "výstup WebP")
	raw := fs.String("raw", "../out/images", "původní PNG")
	size := fs.Int("size", 768, "strana WebP v px")
	_ = fs.Parse(args)
	if *comfy == "" {
		log.Fatal("chybí adresa SPARKu: nastav SPARK_HOST (viz .env.example) nebo -comfy")
	}
	for _, d := range []string{*out, *raw} {
		if err := os.MkdirAll(d, 0o755); err != nil {
			log.Fatal(err)
		}
	}
	files, _ := filepath.Glob(filepath.Join(*dir, "*", "*.yaml"))
	ok, failed := 0, 0
	// Ikona appky: několik variant, vybere Ol1n.
	for i := range 4 {
		name := fmt.Sprintf("app_icon_%d", i+1)
		if _, err := os.Stat(filepath.Join(*raw, name+".png")); err == nil {
			continue
		}
		if err := render(*comfy, iconPrompt, name, *raw, int64(7000+i)); err != nil {
			slog.Error("ikona", "err", err)
		}
	}
	for _, f := range files {
		r, err := ontology.LoadYAML[content.Recipe](f)
		if err != nil {
			slog.Error("recept", "file", f, "err", err)
			failed++
			continue
		}
		webp := filepath.Join(*out, r.Slug+".webp")
		if _, err := os.Stat(webp); err == nil {
			ok++
			continue
		}
		prompt := imagePrompt(r)
		if err := render(*comfy, prompt, r.Slug, *raw, seedFor(r.Slug)); err != nil {
			slog.Error("obrázek", "slug", r.Slug, "err", err)
			failed++
			continue
		}
		png := filepath.Join(*raw, r.Slug+".png")
		cmd := exec.Command("cwebp", "-quiet", "-q", "78", "-resize", fmt.Sprint(*size), "0", png, "-o", webp)
		if b, err := cmd.CombinedOutput(); err != nil {
			slog.Error("cwebp", "slug", r.Slug, "err", err, "out", string(b))
			failed++
			continue
		}
		slog.Info("obrázek hotov", "slug", r.Slug)
		ok++
	}
	fmt.Printf(`{"images":{"ok":%d,"failed":%d}}`+"\n", ok, failed)
	if failed > 0 {
		os.Exit(1)
	}
}

const iconPrompt = "app icon, a cute smiling cartoon cooking pot with a little steam cloud and a wooden spoon, centered, " +
	"filling the frame, solid warm orange background, clean flat comic illustration, bold uniform black outlines, simple cel shading, no text"

func imagePrompt(r content.Recipe) string {
	p := strings.TrimSuffix(strings.TrimSpace(r.ImagePrompt), ".")
	if p == "" {
		p = "a plate of " + r.EN.Title
	}
	low := strings.ToLower(p + " " + r.EN.Title)
	for k, h := range dishHints {
		if strings.Contains(low, k) {
			p += ", " + h
		}
	}
	return p + ", seen from slightly above, " + styles["flat-komiks"]
}

// seedFor dává stabilní seed: stejný recept = stejný obrázek při opakování.
func seedFor(slug string) int64 {
	h := fnv.New32a()
	h.Write([]byte(slug))
	return int64(h.Sum32())
}
