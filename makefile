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

edit_prod_secrets:  ## Edit Ansible production secrets
> @ansible-vault edit playbooks/roles/server_setup/vars/secrets.yml --vault-password-file .vault_pass.txt

edit_stage_secrets:  ## Edit Ansible staging secrets
> @ansible-vault edit playbooks/roles/server_setup/vars/secrets_staging.yml

help:  ## Displays help.
> @grep -E '^[a-zA-Z_-]+[0-9]*:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

staging:  ## Runs ansible-playbook against local vagrant machine. Example make staging PARAMS='--tags os-setup'
> @/bin/bash scripts/make/run_staging.sh '$(PARAMS)'

tags:  ## Lists available ansible tags for deploying only certain components to server
> @grep -oP '(?<=tags: ).*' ./playbooks/roles/server_setup/tasks/main.yml | tr -d "'" | tr -d ' ' | tr -d '[' | tr -d ']' | tr , ' ' | cut -f1 -d' ' | sort

group_tags:  ## Lists available ansible group tags for deploying only certain components to server
> @grep -oP '(?<=tags: ).*' ./playbooks/roles/server_setup/tasks/main.yml | tr -d "'" | tr -d ' ' | tr -d '[' | tr -d ']' | tr , ' ' | cut -f2 -d' ' | sort | uniq

view_prod_secrets:  ## Show Ansible production secrets
> @ansible-vault view playbooks/roles/server_setup/vars/secrets.yml --vault-password-file .vault_pass.txt

view_stage_secrets:  ## Show Ansible staging secrets
> @ansible-vault view playbooks/roles/server_setup/vars/secrets_staging.yml