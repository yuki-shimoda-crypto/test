# format

.PHONY: format
format:
	black .
	isort .

.PHONY: format-check
format-check:
	black --check .
	isort --check-only .

.PHONY: format-diff
format-diff:
	black --diff --color .
	isort --diff .

# docker

.PHONY: up
up:
	docker compose up --build

.PHONY: up-d
up-d:
	docker compose up -d --build

.PHONY: down
down:
	docker compose down

.PHONY: down-v
down-v:
	docker compose down -v

.PHONY: exec-db
exec-db:
	docker compose exec -it db bash

.PHONY: exec-web_dev
exec-web_dev:
	docker compose exec -it web_dev bash

.PHONY: exec-web_prod
exec-web_prod:
	docker compose exec -it web_prod bash

