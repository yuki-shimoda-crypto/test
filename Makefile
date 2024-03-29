SRC_DIR = mysite/

.PHONY: check-format
check_format:
	black --check ${SRC_DIR}

.PHONY: format
format:
	black ${SRC_DIR}

.PHONY: format-diff
format-diff:
	black --diff --color ${SRC_DIR}
