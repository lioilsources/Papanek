.PHONY: test seed content sqlc db

test:
	cd tools && go test ./...

seed:
	cd tools && go run ./cmd/papanek-onto merge

content:
	cd tools && go run ./cmd/papanek-export

sqlc:
	cd tools && sqlc generate

db:
	docker compose up -d db
