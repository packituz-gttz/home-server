#!/bin/bash

echo "Starting Kavita Directory Creation for new files"

PROGRAMING_BOOKS_PATH=/mnt/media-nvm/Kavita/manga/Books/Programming
NOVELS_BOOKS_PATH=/mnt/media-nvm/Kavita/manga/Books/Novels

cd "${PROGRAMING_BOOKS_PATH}" || exit 1

find "${PROGRAMING_BOOKS_PATH}" -maxdepth 1 -type f -exec sh -c 'mkdir "$(basename "$1" .pdf)"; mv "$1" "$(basename "$1" .pdf)"' sh {} \;
find "${PROGRAMING_BOOKS_PATH}" -maxdepth 1 -type f -exec sh -c 'mkdir "$(basename "$1" .epub)"; mv "$1" "$(basename "$1" .epub)"' sh {} \;

cd "${NOVELS_BOOKS_PATH}" || exit 1

find "${NOVELS_BOOKS_PATH}" -maxdepth 1 -type f -exec sh -c 'mkdir "$(basename "$1" .pdf)"; mv "$1" "$(basename "$1" .pdf)"' sh {} \;
find "${NOVELS_BOOKS_PATH}" -maxdepth 1 -type f -exec sh -c 'mkdir "$(basename "$1" .epub)"; mv "$1" "$(basename "$1" .epub)"' sh {} \;

echo "Finished Kavita Directory Creation for new files"