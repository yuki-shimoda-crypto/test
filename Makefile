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
.PHONY: check
check: check-CSS check-HTML check-Dockerfile check-JavaScript check-MD check-Python check-YAML

.PHONY: check-CSS
check-CSS:
	npx prettier "**/*.css" --check
	npx stylelint "**/*.{css,html,js}"

.PHONY: check-HTML
check-HTML:
	npx htmlhint "**/*.html"
	npx stylelint "**/*.html"

.PHONY: check-Dockerfile
check-Dockerfile:
	hadolint --ignore DL3008 --ignore DL3013 --ignore DL3059 Dockerfile Dockerfile.dev

.PHONY: check-JavaScript
check-JavaScript:
	npx eslint .
	npx prettier "**/*.js" --check
	npx stylelint "**/*.js"

.PHONY: check-MD
check-MD:
	npx prettier "**/*.md" --check

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
format: format-CSS format-HTML format-JavaScript format-MD format-Python

.PHONY: format-CSS
format-CSS:
	-npx prettier "**/*.css" --write
	-npx stylelint "**/*.{css,html,js}" --fix

.PHONY: format-HTML
format-HTML:
	-npx prettier "**/*.html" --write
	-npx stylelint "**/*.html" --fix

.PHONY: format-JavaScript
format-JavaScript:
	-npx prettier "**/*.js" --write
	-npx stylelint "**/*.js" --fix

.PHONY: format-MD
format-MD:
	-npx prettier "**/*.md" --write

.PHONY: format-Python
format-Python:
	-black .
	-isort .
