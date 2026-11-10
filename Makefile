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

# Compose na JODĚ; DB_BIND = její LAN adresa, aby na port dosáhl Mac.
define on_joda
ssh $(JODA) 'cd $(JODA_DIR) && DB_BIND=$$(hostname -I | cut -d" " -f1) DB_PORT=$(DB_PORT) \
	POSTGRES_PASSWORD=$(or $(POSTGRES_PASSWORD),papanek) docker compose -p papanek-$(PROFILE) $(1)'
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
	@echo "DATABASE_URL=$(DATABASE_URL)"

db-down:
	$(call on_joda,down)

db-logs:
	$(call on_joda,logs -f --tail=50 db)

db-reset: ## Smaže svazek profilu $(PROFILE) a nastartuje čistou databázi (ZTRÁTA DAT)
	$(call on_joda,down -v)
	$(MAKE) db PROFILE=$(PROFILE)

psql:
	$(call on_joda,exec db psql -U papanek -d papanek)
