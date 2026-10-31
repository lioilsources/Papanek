-- content.db — read-only SQLite zapečená v appce (assets/content.db).
-- Zdroj pravdy pro Flutter i pro papanek-export. Viz plán §6, §9, §11.
-- Verze obsahu je v meta('content_version'); schéma v PRAGMA user_version.
PRAGMA user_version = 1;

CREATE TABLE meta (
  key   TEXT PRIMARY KEY,
  value TEXT NOT NULL
) WITHOUT ROWID;

CREATE TABLE units (
  id   TEXT PRIMARY KEY,                 -- g, ml, ks, lzice, ...
  name TEXT NOT NULL,
  kind TEXT NOT NULL CHECK (kind IN ('mass', 'volume', 'count'))
) WITHOUT ROWID;

CREATE TABLE ingredients (
  id                 INTEGER PRIMARY KEY,
  slug               TEXT NOT NULL UNIQUE,
  canonical_name_cs  TEXT NOT NULL,
  canonical_name_en  TEXT NOT NULL,
  category           TEXT NOT NULL,
  default_unit       TEXT NOT NULL REFERENCES units(id),
  grams_per_piece    REAL,
  is_staple          INTEGER NOT NULL DEFAULT 0 CHECK (is_staple IN (0, 1)),
  default_shelf_days INTEGER,             -- NULL = neomezeně trvanlivé
  allergens          TEXT NOT NULL DEFAULT '[]', -- JSON pole
  icon_file          TEXT
);

CREATE TABLE ingredient_aliases (
  ingredient_id INTEGER NOT NULL REFERENCES ingredients(id),
  alias         TEXT NOT NULL,            -- lowercase, s diakritikou
  alias_ascii   TEXT NOT NULL,            -- lowercase, bez diakritiky (našeptávač)
  lang          TEXT NOT NULL CHECK (lang IN ('cs', 'en')),
  PRIMARY KEY (alias, lang, ingredient_id)
) WITHOUT ROWID;
CREATE INDEX ingredient_aliases_ascii ON ingredient_aliases (alias_ascii);

-- ingredient_id NULL = obecná konverze (lžíce → ml)
CREATE TABLE unit_conversions (
  from_unit     TEXT NOT NULL REFERENCES units(id),
  to_unit       TEXT NOT NULL REFERENCES units(id),
  ingredient_id INTEGER REFERENCES ingredients(id),
  factor        REAL NOT NULL CHECK (factor > 0)
);
CREATE UNIQUE INDEX unit_conversions_key
  ON unit_conversions (from_unit, to_unit, COALESCE(ingredient_id, 0));

CREATE TABLE substitutions (
  ingredient_id INTEGER NOT NULL REFERENCES ingredients(id),
  substitute_id INTEGER NOT NULL REFERENCES ingredients(id),
  ratio         REAL NOT NULL DEFAULT 1 CHECK (ratio > 0),
  note          TEXT,
  PRIMARY KEY (ingredient_id, substitute_id)
) WITHOUT ROWID;

CREATE TABLE packs (
  id                 TEXT PRIMARY KEY,    -- free, czech, italian, ...
  name_cs            TEXT NOT NULL,
  name_en            TEXT NOT NULL,
  product_id_ios     TEXT,                -- NULL u free
  product_id_android TEXT,
  sort               INTEGER NOT NULL DEFAULT 0,
  cover_image        TEXT
) WITHOUT ROWID;

CREATE TABLE recipes (
  id             INTEGER PRIMARY KEY,
  slug           TEXT NOT NULL UNIQUE,
  pack_id        TEXT NOT NULL REFERENCES packs(id),
  cuisine        TEXT NOT NULL,
  difficulty     INTEGER NOT NULL CHECK (difficulty BETWEEN 1 AND 3),
  prep_min       INTEGER NOT NULL,
  cook_min       INTEGER NOT NULL,
  servings       INTEGER NOT NULL CHECK (servings > 0),
  popularity     REAL NOT NULL DEFAULT 0,  -- vstup rankingu v §8
  image_file     TEXT,
  thumb_file     TEXT
);
CREATE INDEX recipes_pack ON recipes (pack_id);

CREATE TABLE recipe_translations (
  recipe_id INTEGER NOT NULL REFERENCES recipes(id),
  lang      TEXT NOT NULL CHECK (lang IN ('cs', 'en')),
  title     TEXT NOT NULL,
  summary   TEXT NOT NULL DEFAULT '',
  steps     TEXT NOT NULL,                 -- JSON: [{text, timer_sec?, action_icon?, glossary?:[slug]}]
  tips      TEXT NOT NULL DEFAULT '',
  PRIMARY KEY (recipe_id, lang)
) WITHOUT ROWID;

CREATE TABLE recipe_ingredients (
  recipe_id     INTEGER NOT NULL REFERENCES recipes(id),
  ingredient_id INTEGER NOT NULL REFERENCES ingredients(id),
  qty           REAL,                      -- NULL = podle chuti
  unit          TEXT REFERENCES units(id),
  optional      INTEGER NOT NULL DEFAULT 0 CHECK (optional IN (0, 1)),
  note          TEXT,
  PRIMARY KEY (recipe_id, ingredient_id)
) WITHOUT ROWID;
CREATE INDEX recipe_ingredients_ingredient ON recipe_ingredients (ingredient_id);

CREATE TABLE recipe_tags (
  recipe_id INTEGER NOT NULL REFERENCES recipes(id),
  tag       TEXT NOT NULL,
  PRIMARY KEY (recipe_id, tag)
) WITHOUT ROWID;
CREATE INDEX recipe_tags_tag ON recipe_tags (tag);

-- §9: glosář a FAQ jsou předpočítané, za běhu žádný LLM.
CREATE TABLE glossary (
  slug       TEXT NOT NULL,
  lang       TEXT NOT NULL CHECK (lang IN ('cs', 'en')),
  term       TEXT NOT NULL,
  definition TEXT NOT NULL,
  image_file TEXT,
  PRIMARY KEY (slug, lang)
) WITHOUT ROWID;

CREATE TABLE recipe_faq (
  recipe_id INTEGER NOT NULL REFERENCES recipes(id),
  lang      TEXT NOT NULL CHECK (lang IN ('cs', 'en')),
  sort      INTEGER NOT NULL,
  question  TEXT NOT NULL,
  answer    TEXT NOT NULL,
  PRIMARY KEY (recipe_id, lang, sort)
) WITHOUT ROWID;

-- §11: offline mapa čárových kódů z Open Food Facts.
CREATE TABLE ean_map (
  ean           TEXT PRIMARY KEY,
  ingredient_id INTEGER NOT NULL REFERENCES ingredients(id)
) WITHOUT ROWID;

-- §9: fulltext. Tokenizer remove_diacritics najde „kure“ i „kuře“.
CREATE VIRTUAL TABLE recipe_fts USING fts5 (
  title,
  ingredients,
  tags,
  lang UNINDEXED,
  recipe_id UNINDEXED,
  tokenize = "unicode61 remove_diacritics 2"
);
