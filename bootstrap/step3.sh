#!/bin/bash

set -euo pipefail
echo "installing asdf and jq"
# --quiet means it won't fail the install if asdf if already installed
brew install --quiet asdf jq

# the following are already in the dotfiles repo
#echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.bash_profile
#echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.bash_profile
