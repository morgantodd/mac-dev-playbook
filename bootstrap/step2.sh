#!/bin/bash

set -euo pipefail

if [[ $(arch) == "i386" ]]; then
    BREW_PATH=/usr/local/bin/brew
elif [[ $(arch) == "arm64" ]]; then
    BREW_PATH=/opt/homebrew/bin/brew
else
    echo "Unknown architecture $(arch); only i386 and arm64 are supported"
    exit 1
fi

if ! which brew > /dev/null
then
  echo "installing homebrew"
  MY_DIR=$(dirname $0)
  /bin/bash -c "./${MY_DIR}/brew-installer.sh"
  echo "Setting up the path to brew"
  echo "eval \"$(${BREW_PATH} shellenv)\"" >> ~/.bashrc
  eval "$(${BREW_PATH} shellenv)"
fi
