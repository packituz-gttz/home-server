#!/bin/bash
MESSAGE=$*
# shellcheck source=/dev/null
source /etc/environment
curl -u "${NTFY_ADMIN}":"${NTFY_PASSWORD}" -d "${MESSAGE}" https://ntfy.packituz.dev/"${NTFY_TOPIC}"