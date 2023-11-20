#!/bin/bash
# Executes main playbook against vagrant machine. Any additional flags for ansible-playbook
# can be passed using the PARAMS variable.
# --tags flag must be passed in order to execute the desired steps.

PARAMS="${1}"
cd playbooks && ANSIBLE_ARGS="-e secrets_file=./roles/server_setup/vars/secrets_staging.yml ${PARAMS}" VAGRANT_EXPERIMENTAL=disks vagrant up --provision
