package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"github.com/lioilsources/papanek/tools/internal/content"
	"github.com/lioilsources/papanek/tools/internal/ontology"
)

// exportRecipes zapíše seed/recipes/<pack>/*.yaml. Chybějící surovina je chyba:
// recept bez ní by matching „co uvařím“ počítal špatně.
func exportRecipes(tx *sql.Tx, dir string, ids map[string]int, items []ontology.Ingredient) (int, error) {
	files, err := filepath.Glob(filepath.Join(dir, "*", "*.yaml"))
	if err != nil {
		return 0, err
	}
	sort.Strings(files)
	// Obrázky jsou volitelné, dokud nejsou vyrobené: recept bez nich má NULL.
	images := filepath.Join(dir, "..", "..", "app", "assets", "images")
	for i, f := range files {
		r, err := ontology.LoadYAML[content.Recipe](f)
		if err != nil {
			return 0, err
		}
		id := i + 1
		var img, thumb any
		if _, err := os.Stat(filepath.Join(images, r.Slug+".webp")); err == nil {
			img, thumb = r.Slug+".webp", r.Slug+".webp"
		}
		if _, err := tx.Exec(`INSERT INTO recipes (id, slug, pack_id, cuisine, difficulty, prep_min, cook_min, servings, popularity, image_file, thumb_file)
			VALUES (?,?,?,?,?,?,?,?,0,?,?)`, id, r.Slug, r.Pack, r.Cuisine, r.Difficulty, r.PrepMin, r.CookMin, r.Servings, img, thumb); err != nil {
			return 0, fmt.Errorf("%s: %w", f, err)
		}
		names := map[string][]string{}
		for _, l := range r.Ingredients {
			ing, ok := ids[l.Ingredient]
			if !ok {
				return 0, fmt.Errorf("%s: neznámá surovina %q", f, l.Ingredient)
			}
			var unit, note any
			if l.Unit != "" {
				unit = l.Unit
			}
			if l.NoteCS != "" || l.NoteEN != "" {
				b, _ := json.Marshal(map[string]string{"cs": l.NoteCS, "en": l.NoteEN})
				note = string(b)
			}
			if _, err := tx.Exec(`INSERT INTO recipe_ingredients VALUES (?,?,?,?,?,?)`,
				id, ing, l.Qty, unit, l.Optional, note); err != nil {
				return 0, fmt.Errorf("%s: %w", f, err)
			}
			in := items[ing-1]
			names["cs"] = append(names["cs"], in.CS)
			names["en"] = append(names["en"], in.EN)
		}
		for _, t := range r.Tags {
			if _, err := tx.Exec(`INSERT OR IGNORE INTO recipe_tags VALUES (?,?)`, id, t); err != nil {
				return 0, err
			}
		}
		for lang, t := range map[string]content.Text{"cs": r.CS, "en": r.EN} {
			steps, _ := json.Marshal(t.Steps)
			if _, err := tx.Exec(`INSERT INTO recipe_translations VALUES (?,?,?,?,?,?)`,
				id, lang, t.Title, t.Summary, string(steps), t.Tips); err != nil {
				return 0, err
			}
			if _, err := tx.Exec(`INSERT INTO recipe_fts (title, ingredients, tags, lang, recipe_id) VALUES (?,?,?,?,?)`,
				t.Title, strings.Join(names[lang], " "), strings.Join(r.Tags, " "), lang, id); err != nil {
				return 0, err
			}
		}
	}
	return len(files), nil
}
