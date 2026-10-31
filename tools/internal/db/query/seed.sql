-- name: UpsertRawRecipe :one
INSERT INTO raw_recipes (source, source_url, source_license, title, lang, cuisine,
                         prep_min, cook_min, servings, ingredients, steps)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
ON CONFLICT (source_url) DO UPDATE SET
  title = EXCLUDED.title, ingredients = EXCLUDED.ingredients, steps = EXCLUDED.steps,
  fetched_at = now()
RETURNING id;

-- name: UpsertIngredient :one
INSERT INTO ingredients (slug, canonical_name_cs, canonical_name_en, category, default_unit,
                         grams_per_piece, is_staple, default_shelf_days, allergens)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
ON CONFLICT (slug) DO UPDATE SET
  canonical_name_cs = EXCLUDED.canonical_name_cs, canonical_name_en = EXCLUDED.canonical_name_en,
  category = EXCLUDED.category, default_unit = EXCLUDED.default_unit,
  grams_per_piece = EXCLUDED.grams_per_piece, is_staple = EXCLUDED.is_staple,
  default_shelf_days = EXCLUDED.default_shelf_days, allergens = EXCLUDED.allergens
RETURNING id;

-- name: AddReviewLine :exec
INSERT INTO ingredient_review_queue (raw_line, lang) VALUES ($1, $2)
ON CONFLICT (raw_line) DO UPDATE SET seen_count = ingredient_review_queue.seen_count + 1;
