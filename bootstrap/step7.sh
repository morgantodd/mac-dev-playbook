#!/bin/bash

source ~/.bashrc
# source this so we can start running ansible, straight after installing it via asdf
# note this is being done before `set -u` as an undefined $ASDF_DIR will cause the
# script to fail
source $(brew --prefix asdf)/libexec/asdf.sh

set -euo pipefail
echo "installing mac-dev-playbook requirements"


ansible-galaxy install -r requirements.yml
ansible-playbook --skip-tags "asdf-install" main.yml --ask-become-pass
