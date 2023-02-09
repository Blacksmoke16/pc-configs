#! /usr/bin/env bash

set -e # -e: exit on error

if [ ! "$(command -v chezmoi)" ]; then
  echo "chezmoi is not installed!" >&2
  exit 1
else
  chezmoi=chezmoi
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
# Source directory should be this git repo, where ever it is cloned
SOURCE_DIR="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

exec "$chezmoi" init --source=$SOURCE_DIR --promptString=sourceDir=$SOURCE_DIR
