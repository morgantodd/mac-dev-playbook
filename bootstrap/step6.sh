#!/bin/bash

# need to source this so we can run jq
source $(brew --prefix asdf)/libexec/asdf.sh

# source this so we can start running ansible, straight after installing it via asdf
# note this is being done before `set -u` as an undefined $ASDF_DIR will cause the
# script to fail

set -euo pipefail
echo "installing dockutil v3 separately as homebrew does not support it yet"
echo "see https://github.com/kcrawford/dockutil/issues/127"

DLURL=$(curl --silent "https://api.github.com/repos/kcrawford/dockutil/releases/latest" | jq -r .assets[].browser_download_url | grep pkg)
curl -sL ${DLURL} -o /tmp/dockutil.pkg
sudo installer -pkg "/tmp/dockutil.pkg" -target /
rm /tmp/dockutil.pkg
