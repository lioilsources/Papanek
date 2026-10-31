# Papánek

Offline kuchařka pro začátečníky: ví, co máš doma, a vybere recept. Plán je v
`Prompts/00-PAPANEK_PLAN.md`.

- `schema/content.sql`: schéma read-only `content.db` pro appku
- `seed/`: ontologie surovin, jednotky, balíčky. `seed/ingredients.yaml` se generuje
  z `seed/parts/` příkazem `make seed`, upravuj díly
- `tools/`: Go nástroje pro výrobu obsahu, nikdy neběží na telefonu
  - `papanek-onto`: slučování, kontrola a měření ontologie
  - `papanek-ingest`: extrakce z dumpů Wikibooks a ze schema.org/Recipe
  - `papanek-export`: staví `app/assets/content.db` (zatím bez receptů)
  - `papanek-enrich`: ukázky stylů, na Sparku jen přes `sparkctl`
- `app/`: Flutter, `com.ol1n.papanek`

```sh
make test       # testy nástrojů
make seed       # sloučí seed/parts do seed/ingredients.yaml
make content    # postaví content.db
make db         # lokální Postgres s pgvector na portu 5437
```

## Zdroje dat

Wikibooks se čtou z dumpů `dumps.wikimedia.org`, protože `robots.txt` zakazuje `/w/`
včetně API. Dumpy patří do `data/dumps/`, která se necommituje.
