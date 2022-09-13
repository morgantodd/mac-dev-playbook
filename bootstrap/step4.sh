#!/bin/bash

set -euo pipefail
BASH_CONFIG_FILE=~/.bashrc
if [[ -f "$BASH_CONFIG_FILE" ]]; then
    source ~/.bashrc
fi

echo "setting up python"

if ! asdf plugin list | grep '^python$' > /dev/null
then
  asdf plugin add python
  asdf install python 3.8.13 # the mac-dev-playbook wants 3.8, but could test 3.9+ in the future
  asdf global python 3.8.13
fi


echo "setting up jq"

if ! asdf plugin list | grep '^jq$' > /dev/null
then
  asdf plugin add jq
  asdf install jq latest
  asdf global jq latest
fi
