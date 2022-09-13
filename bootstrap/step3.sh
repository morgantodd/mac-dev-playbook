#!/bin/bash

set -euo pipefail

BASH_CONFIG_FILE=~/.bashrc
if [[ -f "$BASH_CONFIG_FILE" ]]; then
    source ~/.bashrc
fi

echo "installing asdf"
# --quiet means it won't fail the install if asdf if already installed
brew install --quiet asdf

# the following are already in the dotfiles repo
#echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.bash_profile
#echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.bash_profile
