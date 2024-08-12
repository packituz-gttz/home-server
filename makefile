# Wraps common operations for project

# Set more sensible defaults
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

# Target configs
.DEFAULT_GOAL := help

deploy:  ## Runs ansible-playbook against production server. Example make deploy PARAMS='--tags os-setup'
> @/bin/bash scripts/make/run_deployment.sh '$(PARAMS)'

help:  ## Displays help.
> @grep -E '^[a-zA-Z_-]+[0-9]*:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

staging:  ## Runs ansible-playbook against local vagrant machine. Example make staging PARAMS='--tags os-setup'
> @/bin/bash scripts/make/run_staging.sh '$(PARAMS)'