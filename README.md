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
make db         # Postgres s pgvector na JODĚ, profil qa (port 5437)
```

## Databáze na JODĚ

Docker na Macu neběží; build-time Postgres (`docker-compose.yml`) jede na JODĚ ve dvou
profilech a nástroje na něj dosáhnou přes LAN (`DATABASE_URL` skládá Makefile):

| profil | příkaz | port | k čemu |
|---|---|---|---|
| `qa` | `make db` | 5437 | pokusy, ingest, ladění ontologie |
| `prod` | `make db PROFILE=prod` | 5438 | data, ze kterých se exportuje vydaný `content.db` |

`make db` nahraje `docker-compose.yml` a `tools/migrations` do `~/deploy/Papanek` na JODĚ a
spustí projekt `papanek-<profil>`; migrace se aplikují jen na prázdná data. Data leží na pool
disku v `/home/oli/pool-papanek/<profil>/db` (ZFS dataset `pool/papanek`, zakládá Olin se sudo,
DevConventions `shared/infra.md`); dokud dataset není, v `~/deploy/Papanek/data/<profil>/db`.
Port je jen na LAN adrese JODY. Dál `make db-logs`, `make psql`, `make db-down` a
`make db-reset CONFIRM=yes` (smaže data profilu). Každá akce zapíše řádek do
`~/deploy/events.jsonl`. Adresu JODY a heslo lze změnit v `.env` (`JODA_HOST`,
`POSTGRES_PASSWORD`, viz `.env.example`).

## Zdroje dat

Wikibooks se čtou z dumpů `dumps.wikimedia.org`, protože `robots.txt` zakazuje `/w/`
včetně API. Dumpy patří do `data/dumps/`, která se necommituje.
