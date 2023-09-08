#!/bin/bash

# shellcheck source=/dev/null
source /etc/environment
curl -u "${NTFY_ADMIN}":"${NTFY_PASSWORD}" -d "Shutting down server, due to power outrage" https://ntfy.packituz.dev/"${NTFY_TOPIC}"

shutdown -h now