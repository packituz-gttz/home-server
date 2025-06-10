#!/bin/bash

# shellcheck disable=SC2153
for MODEL in ${MODELS}
do
  ollama pull "${MODEL}"
done

exec /bin/ollama serve

