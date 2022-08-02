#!/bin/bash

set -euo pipefail

if ! which brew > /dev/null
then
  echo "installing homebrew"
  MY_DIR=$(dirname $0)
  /bin/bash -c "./${MY_DIR}/brew-installer.sh"
  echo "Setting up the path to brew"
  echo 'eval "$(/opt/homebrew/bin/barew shellenv)"' >> ~/.bashrc
  eval "$(/opt/homebrew/bin/barew shellenv)"
fi
