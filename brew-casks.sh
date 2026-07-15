#!/usr/bin/env bash

set -euo pipefail

source ./lib.sh

log "Installing GUI applications"

brew install --cask \
    iterm2 \
    visual-studio-code \
    docker \
    rapidapi \
    tableplus \
    rectangle \
    stats \
    raycast \
    obsidian \
    spotify \
    firefox

brew install --cask jetbrains-toolbox

log "GUI applications installed"