// papanek-ingest stahuje surová data receptů do JSONL (plán §5).
//
//	papanek-ingest wikibooks -lang en -dump enwikibooks.xml.bz2 -out ../data/raw/wikibooks-en.jsonl
//	papanek-ingest schemaorg -urls urls.txt -license unknown -out ../data/raw/web.jsonl
package main

import (
	"bufio"
	"context"
	"errors"
	"flag"
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	"github.com/lioilsources/papanek/tools/internal/ingest"
)

func main() {
	if len(os.Args) < 2 {
		log.Fatal("použití: papanek-ingest wikibooks|schemaorg [volby]")
	}
	ctx := context.Background()
	fs := flag.NewFlagSet(os.Args[1], flag.ExitOnError)
	out := fs.String("out", "", "výstupní JSONL")
	delay := fs.Duration("delay", time.Second, "rozestup dotazů na jeden host")
	var run func(*ingest.Client) ([]ingest.RawRecipe, error)

	switch os.Args[1] {
	case "wikibooks":
		lang := fs.String("lang", "en", "en nebo cs")
		dump := fs.String("dump", "", "dump <wiki>-latest-pages-articles.xml.bz2")
		run = func(*ingest.Client) ([]ingest.RawRecipe, error) {
			site, ok := ingest.Sites[*lang]
			if !ok {
				return nil, fmt.Errorf("neznámý jazyk %q", *lang)
			}
			f, err := os.Open(*dump)
			if err != nil {
				return nil, err
			}
			defer f.Close()
			return ingest.ReadDump(f, site)
		}
	case "schemaorg":
		urls := fs.String("urls", "", "soubor s URL, jedna na řádek")
		license := fs.String("license", "", "licence zdroje, povinná (loguje se do source_license)")
		run = func(c *ingest.Client) ([]ingest.RawRecipe, error) {
			if *license == "" {
				return nil, errors.New("chybí -license")
			}
			return scrape(ctx, c, *urls, *license)
		}
	default:
		log.Fatalf("neznámý příkaz %q", os.Args[1])
	}
	if err := fs.Parse(os.Args[2:]); err != nil {
		log.Fatal(err)
	}
	if *out == "" {
		log.Fatal("chybí -out")
	}
	rs, err := run(ingest.NewClient(*delay))
	if err != nil {
		log.Fatal(err)
	}
	f, err := os.Create(*out)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	if err := ingest.WriteJSONL(f, rs); err != nil {
		log.Fatal(err)
	}
	log.Printf("receptů: %d → %s", len(rs), *out)
}

func scrape(ctx context.Context, c *ingest.Client, path, license string) ([]ingest.RawRecipe, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer f.Close()
	var out []ingest.RawRecipe
	sc := bufio.NewScanner(f)
	for sc.Scan() {
		u := strings.TrimSpace(sc.Text())
		if u == "" || strings.HasPrefix(u, "#") {
			continue
		}
		body, err := c.Get(ctx, u)
		if err != nil {
			log.Printf("přeskakuji: %v", err)
			continue
		}
		out = append(out, ingest.ExtractSchemaOrg(u, license, body)...)
	}
	return out, sc.Err()
}
