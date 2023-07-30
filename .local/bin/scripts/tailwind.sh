#!/bin/sh
set -e
TAILWIND_ARCHITECTURE=x64 # chose the right architecture for you
TAILWIND_VERSION=v3.3.3 # chose the right version

SOURCE_NAME=tailwindcss-linux-${TAILWIND_ARCHITECTURE}
OUTPUT_NAME=tailwindcss
DOWNLOAD_URL=https://github.com/tailwindlabs/tailwindcss/releases/download/${TAILWIND_VERSION}/${SOURCE_NAME}

curl -sLO ${DOWNLOAD_URL} && chmod +x ${SOURCE_NAME}
mv ${SOURCE_NAME} ${OUTPUT_NAME} # rename it
mv ${OUTPUT_NAME} ${HOME}/.local/bin # move it to be used globally in a folder already in the PATH var

