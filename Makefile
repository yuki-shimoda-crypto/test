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
	docker compose exec -it web_dev zsh

.PHONY: exec-web_prod
exec-web_prod:
	docker compose exec -it web_prod bash

# check
.PHONY: check-All
check-All: check-Dockerfile check-JavaScript check-Python check-YAML

.PHONY: check-Dockerfile
check-Dockerfile:
	hadolint --ignore DL3008 --ignore DL3013 --ignore DL3059 Dockerfile Dockerfile.dev

.PHONY: check-JavaScript
check-JavaScript:
	npx eslint .
	npx prettier . --check

.PHONY: check-Python
check-Python:
	black --check .
	flake8 .
	isort --check-only .
	mypy .

.PHONY: check-YAML
check-YAML:
	yamllint -d relaxed .

# format
.PHONY: format
format: format-JavaScript format-Python

.PHONY: format-JavaScript
format-JavaScript:
	npx prettier . --write

.PHONY: format-Python
format-Python:
	black .
	isort .
