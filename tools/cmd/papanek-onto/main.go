// papanek-onto je admin CLI nad ontologií (plán §14 M0).
//
//	papanek-onto merge -seed ../seed          spojí seed/parts/*.yaml do seed/ingredients.yaml
//	papanek-onto check -seed ../seed          ověří seed
//	papanek-onto eval  -seed ../seed f.tsv    mapuje řádky (sloupec 1 = jazyk, 2 = řádek)
//	                                          a vypíše, co by šlo do ruční review fronty
package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"gopkg.in/yaml.v3"

	"github.com/lioilsources/papanek/tools/internal/lineparse"
	"github.com/lioilsources/papanek/tools/internal/ontology"
)

func main() {
	if len(os.Args) < 2 {
		log.Fatal("použití: papanek-onto merge|check|eval")
	}
	fs := flag.NewFlagSet(os.Args[1], flag.ExitOnError)
	seed := fs.String("seed", "../seed", "adresář seedu")
	_ = fs.Parse(os.Args[2:])
	units, err := ontology.LoadYAML[ontology.UnitsFile](filepath.Join(*seed, "units.yaml"))
	if err != nil {
		log.Fatal(err)
	}
	switch os.Args[1] {
	case "merge":
		merge(*seed, units)
	case "check":
		check(load(*seed), units)
	case "eval":
		eval(load(*seed), units, fs.Arg(0))
	default:
		log.Fatalf("neznámý příkaz %q", os.Args[1])
	}
}

func load(seed string) []ontology.Ingredient {
	items, err := ontology.LoadYAML[[]ontology.Ingredient](filepath.Join(seed, "ingredients.yaml"))
	if err != nil {
		log.Fatal(err)
	}
	return items
}

func check(items []ontology.Ingredient, units ontology.UnitsFile) {
	errs := ontology.Validate(items, units)
	for _, e := range errs {
		fmt.Println(e)
	}
	fmt.Printf("surovin: %d, problémů: %d\n", len(items), len(errs))
	if len(errs) > 0 {
		os.Exit(1)
	}
}

func merge(seed string, units ontology.UnitsFile) {
	parts, _ := filepath.Glob(filepath.Join(seed, "parts", "*.yaml"))
	var all []ontology.Ingredient
	for _, p := range parts {
		items, err := ontology.LoadYAML[[]ontology.Ingredient](p)
		if err != nil {
			log.Fatal(err)
		}
		all = append(all, items...)
	}
	sort.SliceStable(all, func(i, j int) bool { return all[i].Slug < all[j].Slug })
	var b strings.Builder
	b.WriteString("# Ontologie surovin (plán §6, §7). Generuje papanek-onto merge ze seed/parts/.\n")
	for _, in := range all {
		one, err := yaml.Marshal([]ontology.Ingredient{in})
		if err != nil {
			log.Fatal(err)
		}
		b.Write(one)
	}
	if err := os.WriteFile(filepath.Join(seed, "ingredients.yaml"), []byte(b.String()), 0o644); err != nil {
		log.Fatal(err)
	}
	check(all, units)
}

func eval(items []ontology.Ingredient, units ontology.UnitsFile, path string) {
	f, err := os.Open(path)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()
	p := lineparse.New(units.Units)
	matchers := map[string]*ontology.Matcher{
		"cs": ontology.NewMatcher(items, "cs"),
		"en": ontology.NewMatcher(items, "en"),
	}
	total, auto := 0, 0
	sc := bufio.NewScanner(f)
	for sc.Scan() {
		lang, line, ok := strings.Cut(sc.Text(), "\t")
		if !ok {
			continue
		}
		l := p.Parse(line)
		m := matchers[lang].Find(l.Name)
		total++
		if m.Automatic() {
			auto++
			fmt.Printf("ok\t%d\t%s\t%s\t%s\n", m.Confidence, m.Slug, l.Name, line)
		} else {
			fmt.Printf("REVIEW\t%d\t%s\t%s\t%s\n", m.Confidence, m.Slug, l.Name, line)
		}
	}
	fmt.Printf("automaticky %d/%d = %.1f %%\n", auto, total, 100*float64(auto)/float64(max(total, 1)))
}
