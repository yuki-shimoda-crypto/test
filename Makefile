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
.PHONY: check-all-file
check-all-file: format-check lint

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

# lint
.PHONY: lint
lint: lint-Docker lint-Python lint-YAML

.PHONY: lint-Docker
lint-Docker:
	hadolint --ignore DL3008 --ignore DL3013 --ignore DL3059 Dockerfile Dockerfile.dev

.PHONY: lint-Python
lint-Python:
	flake8 .
	mypy .

.PHONY: lint-YAML
lint-YAML:
	yamllint -d relaxed .
