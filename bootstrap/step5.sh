#!/bin/bash

set -euo pipefail
BASH_CONFIG_FILE=~/.bashrc
if [[ -f "$BASH_CONFIG_FILE" ]]; then
    source ~/.bashrc
fi

echo "setting up ansible-base"

if ! asdf plugin list | grep '^ansible-base$' > /dev/null
then
  asdf plugin add ansible-base
  asdf install ansible-base latest
  asdf global ansible-base latest
fi
