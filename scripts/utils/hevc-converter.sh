#!/bin/bash
# shellcheck disable=all
# Converts videos to HEVC using ffmpeg, please not that this script
# is not recommended for production usage, it works for my use case, use it at
# your own risk

INPUT_DIR="${1}" #Relative

mkdir -p video_bk/"${INPUT_DIR}"

rsync -a --include '*/' --exclude '*' "${INPUT_DIR}" video_bk/"${INPUT_DIR}"

#find "${INPUT_DIR}" -type f -exec sh -c 'echo -en "{}\t"; ffmpeg -i "{}" -c:v libx265 -c:a copy -c:s srt "video_bk/{}"; sleep 20' \;

find "${INPUT_DIR}" -type f | parallel --dry-run -j 4 'output_file="video_bk/{/}"; echo -en "{/}\t"; ffmpeg -i {} -c:v libx265 -c:a copy -c:s srt "$output_file"; sleep 20'
