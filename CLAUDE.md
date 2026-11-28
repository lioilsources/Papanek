# Papánek

<!-- Max 80 řádků. Co se nevejde, jde do docs/ a sem jeden odkaz. Veřejné repo: žádné LAN IP, domovské cesty, ID. -->

## Účel
Offline kuchařka pro začátečníky: ví, co máš doma, a vybere recept. Flutter appka
(`com.ol1n.papanek`) čte read-only `content.db`, který staví Go nástroje v `tools/`.

## Build a test
```
make test                              # go test v tools/
make seed                              # seed/parts -> seed/ingredients.yaml
make content                           # postaví app/assets/content.db
cd app && flutter analyze && flutter test   # totéž co CI
```
Gate před pushem: `make test` a `flutter analyze` + `flutter test` v `app/`.

## Mapa
- `app/`: Flutter appka
- `tools/`: Go nástroje pro výrobu obsahu (`papanek-onto`, `-ingest`, `-export`, `-enrich`), na telefonu neběží
- `schema/content.sql`: schéma `content.db`
- `seed/`: ontologie surovin, jednotky, balíčky
- `docker-compose.yml`, `tools/migrations/`: build-time Postgres na JODĚ (`make db`)
- `docs/`: privacy a support stránky (GitHub Pages)
- `Prompts/00-PAPANEK_PLAN.md`: plán

## Invarianty
- `seed/ingredients.yaml` se generuje z `seed/parts/` (`make seed`); upravuj díly.
- Wikibooks jen z dumpů (`robots.txt` zakazuje API); `data/` se necommituje.
- `papanek-enrich` na SPARKu jen přes `sparkctl`.
- `make db-reset` maže data profilu, chce `CONFIRM=yes`.

## Kam dál
README (databáze na JODĚ, profily qa/prod), `Prompts/00-PAPANEK_PLAN.md`
