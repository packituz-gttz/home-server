#!/bin/bash
set -e
WEAR_DOWN=$(nvme smart-log /dev/nvme0n1 --o json | jq '.percent_used')
if [ "${WEAR_DOWN}" -gt 45 ]; then
  echo "DISK WEAR DOWN ${WEAR_DOWN}"
  exit 250
fi
exit 0
