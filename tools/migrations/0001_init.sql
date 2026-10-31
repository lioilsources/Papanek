-- Build-time Postgres (jen výroba obsahu, nikdy runtime). Plán §6.
CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE TABLE units (
  id   text PRIMARY KEY,
  name text NOT NULL,
  kind text NOT NULL CHECK (kind IN ('mass', 'volume', 'count'))
);

CREATE TABLE ingredients (
  id                 bigserial PRIMARY KEY,
  slug               text NOT NULL UNIQUE,
  canonical_name_cs  text NOT NULL,
  canonical_name_en  text NOT NULL,
  category           text NOT NULL,
  default_unit       text NOT NULL REFERENCES units(id),
  grams_per_piece    double precision,
  is_staple          boolean NOT NULL DEFAULT false,
  default_shelf_days integer,
  allergens          text[] NOT NULL DEFAULT '{}',
  embedding          vector(1024)
);

CREATE TABLE ingredient_aliases (
  ingredient_id bigint NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
  alias         text NOT NULL,
  lang          text NOT NULL CHECK (lang IN ('cs', 'en')),
  PRIMARY KEY (alias, lang, ingredient_id)
);
CREATE INDEX ingredient_aliases_trgm ON ingredient_aliases USING gin (alias gin_trgm_ops);

CREATE TABLE unit_conversions (
  id            bigserial PRIMARY KEY,
  from_unit     text NOT NULL REFERENCES units(id),
  to_unit       text NOT NULL REFERENCES units(id),
  ingredient_id bigint REFERENCES ingredients(id) ON DELETE CASCADE,
  factor        double precision NOT NULL CHECK (factor > 0)
);
CREATE UNIQUE INDEX unit_conversions_key
  ON unit_conversions (from_unit, to_unit, COALESCE(ingredient_id, 0));

CREATE TABLE substitutions (
  ingredient_id bigint NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
  substitute_id bigint NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
  ratio         double precision NOT NULL DEFAULT 1 CHECK (ratio > 0),
  note          text,
  PRIMARY KEY (ingredient_id, substitute_id)
);

CREATE TABLE packs (
  id                 text PRIMARY KEY,
  name_cs            text NOT NULL,
  name_en            text NOT NULL,
  product_id_ios     text,
  product_id_android text,
  sort               integer NOT NULL DEFAULT 0,
  cover_image        text
);

-- Surový ingest: co přišlo ze zdroje, před normalizací a přepisem.
CREATE TABLE raw_recipes (
  id             bigserial PRIMARY KEY,
  source         text NOT NULL,            -- wikibooks, schemaorg, ...
  source_url     text NOT NULL UNIQUE,
  source_license text NOT NULL,
  title          text NOT NULL,
  lang           text NOT NULL,
  cuisine        text,
  prep_min       integer,
  cook_min       integer,
  servings       integer,
  ingredients    text[] NOT NULL,          -- řádky doslova ze zdroje
  steps          text[] NOT NULL,
  fetched_at     timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE recipes (
  id             bigserial PRIMARY KEY,
  slug           text NOT NULL UNIQUE,
  raw_recipe_id  bigint REFERENCES raw_recipes(id),
  pack_id        text REFERENCES packs(id),
  cuisine        text NOT NULL,
  difficulty     integer NOT NULL CHECK (difficulty BETWEEN 1 AND 3),
  prep_min       integer NOT NULL,
  cook_min       integer NOT NULL,
  servings       integer NOT NULL CHECK (servings > 0),
  popularity     double precision NOT NULL DEFAULT 0,
  source_url     text,
  source_license text NOT NULL,
  status         text NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'review', 'approved', 'rejected')),
  image_file     text,
  hero_prompt    text,
  embedding      vector(1024)
);
CREATE INDEX recipes_pack ON recipes (pack_id);

CREATE TABLE recipe_translations (
  recipe_id bigint NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  lang      text NOT NULL CHECK (lang IN ('cs', 'en')),
  title     text NOT NULL,
  summary   text NOT NULL DEFAULT '',
  steps     jsonb NOT NULL,
  tips      text NOT NULL DEFAULT '',
  PRIMARY KEY (recipe_id, lang)
);

CREATE TABLE recipe_ingredients (
  recipe_id     bigint NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  ingredient_id bigint NOT NULL REFERENCES ingredients(id),
  qty           double precision,
  unit          text REFERENCES units(id),
  optional      boolean NOT NULL DEFAULT false,
  note          text,
  PRIMARY KEY (recipe_id, ingredient_id)
);

CREATE TABLE recipe_tags (
  recipe_id bigint NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  tag       text NOT NULL,
  PRIMARY KEY (recipe_id, tag)
);

-- §7 krok 4: neznámé řádky čekají na ruční review.
CREATE TABLE ingredient_review_queue (
  id           bigserial PRIMARY KEY,
  raw_line     text NOT NULL UNIQUE,
  lang         text NOT NULL,
  seen_count   integer NOT NULL DEFAULT 1,
  resolved_to  bigint REFERENCES ingredients(id),
  created_at   timestamptz NOT NULL DEFAULT now()
);
