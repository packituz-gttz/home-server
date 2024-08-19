#!/bin/bash
# Executes main playbook against production server. Any additional flags for ansible-playbook
# can be passed using the PARAMS variable.
# --tags flag must be passed in order to execute the desired steps.

PARAMS="${1}"
# shellcheck disable=SC2086
cd playbooks && ansible-playbook -i inventory.ini configure_server.yml --vault-password-file ../.vault_pass.txt ${PARAMS}
