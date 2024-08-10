#!/bin/bash
# shellcheck disable=all
# List file codec

INPUT_DIR="${1}"

find "${INPUT_DIR}" -type f -exec sh -c 'echo -en "{}\t"; ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "{}"' \;
