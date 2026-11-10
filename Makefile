# Nástroje běží na Macu, Postgres na JODĚ (Docker na Macu není). Dva profily databáze:
#   make db                 qa   (port 5437) – pokusy, ingest, ladění ontologie
#   make db PROFILE=prod    prod (port 5438) – data, ze kterých se exportuje vydaný content.db
# Soubory jedou na JODU přes rsync do ~/deploy/Papanek, compose projekt papanek-<profil>.
.PHONY: test seed content sqlc db db-down db-logs db-reset psql

PROFILE ?= qa
JODA ?= joda
JODA_DIR := deploy/Papanek
DB_PORT := $(if $(filter prod,$(PROFILE)),5438,5437)
-include .env
export

# Nástroje v tools/ zatím Postgres nepoužívají (sqlc je připravené); až budou, berou adresu odsud.
export DATABASE_URL ?= postgres://papanek:$(or $(POSTGRES_PASSWORD),papanek)@$(or $(JODA_HOST),$(JODA)):$(DB_PORT)/papanek?sslmode=disable

# Compose na JODĚ; DB_BIND = její LAN adresa, aby na port dosáhl Mac. Data na pool disku
# (DevConventions shared/infra.md); dokud dataset pool/papanek není, v ~/deploy/Papanek/data.
DB_DIR_ON_JODA = $$( [ -d $$HOME/pool-papanek ] && echo $$HOME/pool-papanek/$(PROFILE)/db || echo $$HOME/deploy/Papanek/data/$(PROFILE)/db )
define on_joda
ssh $(JODA) 'cd $(JODA_DIR) && DB_BIND=$$(hostname -I | cut -d" " -f1) DB_PORT=$(DB_PORT) DB_DIR=$(DB_DIR_ON_JODA) \
	POSTGRES_PASSWORD=$(or $(POSTGRES_PASSWORD),papanek) docker compose -p papanek-$(PROFILE) $(1)'
endef

# Každá akce nechá řádek v ~/deploy/events.jsonl na JODĚ (DevConventions infra-architektura.md).
define joda_event
ssh $(JODA) 'printf "{\"ts\":\"%s\",\"who\":\"%s\",\"repo\":\"Papanek\",\"action\":\"$(1)\",\"profile\":\"$(PROFILE)\",\"commit\":\"%s\"}\n" \
	"$$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$(USER)@$(shell hostname -s)" "$(shell git rev-parse --short HEAD)" >> ~/deploy/events.jsonl'
endef

test:
	cd tools && go test ./...

seed:
	cd tools && go run ./cmd/papanek-onto merge

content:
	cd tools && go run ./cmd/papanek-export

sqlc:
	cd tools && sqlc generate

db: ## Postgres profilu $(PROFILE) na JODĚ (migrace při prvním startu)
	rsync -aR --delete docker-compose.yml tools/migrations $(JODA):$(JODA_DIR)/
	$(call on_joda,up -d --wait)
	$(call joda_event,db up)
	@echo "DATABASE_URL=$(DATABASE_URL)"

db-down:
	$(call on_joda,down)

db-logs:
	$(call on_joda,logs -f --tail=50 db)

db-reset: ## Smaže data profilu $(PROFILE) a nastartuje čistou databázi: make db-reset PROFILE=… CONFIRM=yes
	@[ "$(CONFIRM)" = yes ] || { echo "ZTRÁTA DAT profilu $(PROFILE): spusť znovu s CONFIRM=yes"; exit 1; }
	$(call on_joda,down)
	ssh $(JODA) 'rm -rf $(DB_DIR_ON_JODA)'
	$(call joda_event,db reset)
	$(MAKE) db PROFILE=$(PROFILE)

psql:
	$(call on_joda,exec db psql -U papanek -d papanek)
