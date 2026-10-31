// papanek-export staví content.db (plán §4). Zatím bez receptů: schéma, jednotky,
// ontologie a balíčky ze seedu, aby Flutter mohl stavět nad reálnou DB. Čtení
// receptů z Postgresu přijde v M2.
//
//	papanek-export -seed ../seed -schema ../schema/content.sql -out ../app/assets/content.db
package main

import (
	"database/sql"
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	_ "modernc.org/sqlite"

	"github.com/lioilsources/papanek/tools/internal/ontology"
)

func main() {
	seed := flag.String("seed", "../seed", "adresář seedu")
	schema := flag.String("schema", "../schema/content.sql", "schéma content.db")
	out := flag.String("out", "../app/assets/content.db", "výstupní soubor")
	version := flag.String("content-version", "0.0.0-seed", "hodnota meta.content_version")
	flag.Parse()
	if err := run(*seed, *schema, *out, *version); err != nil {
		log.Fatal(err)
	}
	log.Printf("hotovo: %s", *out)
}

func run(seed, schema, out, version string) error {
	units, err := ontology.LoadYAML[ontology.UnitsFile](filepath.Join(seed, "units.yaml"))
	if err != nil {
		return err
	}
	items, err := ontology.LoadYAML[[]ontology.Ingredient](filepath.Join(seed, "ingredients.yaml"))
	if err != nil {
		return err
	}
	packs, err := ontology.LoadYAML[[]ontology.Pack](filepath.Join(seed, "packs.yaml"))
	if err != nil {
		return err
	}
	if errs := ontology.Validate(items, units); len(errs) > 0 {
		return fmt.Errorf("neplatný seed:\n%s", strings.Join(errs, "\n"))
	}
	ddl, err := os.ReadFile(schema)
	if err != nil {
		return err
	}
	tmp := out + ".tmp"
	_ = os.Remove(tmp)
	db, err := sql.Open("sqlite", tmp)
	if err != nil {
		return err
	}
	defer db.Close()
	if _, err := db.Exec(string(ddl)); err != nil {
		return fmt.Errorf("schéma: %w", err)
	}
	tx, err := db.Begin()
	if err != nil {
		return err
	}
	defer tx.Rollback()
	x := func(q string, args ...any) {
		if err == nil {
			_, err = tx.Exec(q, args...)
		}
	}
	x(`INSERT INTO meta VALUES ('content_version', ?)`, version)
	for _, u := range units.Units {
		x(`INSERT INTO units VALUES (?,?,?)`, u.ID, u.Name, u.Kind)
	}
	for _, c := range units.Conversions {
		x(`INSERT INTO unit_conversions VALUES (?,?,NULL,?)`, c.From, c.To, c.Factor)
	}
	for i, in := range items {
		id := i + 1
		al, _ := json.Marshal(append([]string{}, in.Allergens...))
		var gpp, shelf any
		if in.GramsPerPiece > 0 {
			gpp = in.GramsPerPiece
		}
		if in.ShelfDays != nil {
			shelf = *in.ShelfDays
		}
		x(`INSERT INTO ingredients (id, slug, canonical_name_cs, canonical_name_en, category, default_unit,
		   grams_per_piece, is_staple, default_shelf_days, allergens) VALUES (?,?,?,?,?,?,?,?,?,?)`,
			id, in.Slug, in.CS, in.EN, in.Category, in.Unit, gpp, in.Staple, shelf, string(al))
		for lang, list := range map[string][]string{"cs": in.AliasesCS, "en": in.AliasesEN} {
			for _, a := range list {
				x(`INSERT OR IGNORE INTO ingredient_aliases VALUES (?,?,?,?)`,
					id, strings.ToLower(a), ontology.Normalize(a), lang)
			}
		}
	}
	for i, p := range packs {
		var product any
		if p.Product != "" {
			product = p.Product
		}
		x(`INSERT INTO packs (id, name_cs, name_en, product_id_ios, product_id_android, sort) VALUES (?,?,?,?,?,?)`,
			p.ID, p.NameCS, p.NameEN, product, product, i)
	}
	if err != nil {
		return err
	}
	if err := tx.Commit(); err != nil {
		return err
	}
	if _, err := db.Exec(`PRAGMA foreign_key_check`); err != nil {
		return err
	}
	if _, err := db.Exec(`VACUUM`); err != nil {
		return err
	}
	if err := db.Close(); err != nil {
		return err
	}
	return os.Rename(tmp, out)
}
