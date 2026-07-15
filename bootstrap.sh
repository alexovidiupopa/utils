#!/usr/bin/env bash

set -euo pipefail

source ./lib.sh

log "Starting Mac development bootstrap"

if ! xcode-select -p &>/dev/null; then
    log "Installing Xcode Command Line Tools"

    xcode-select --install

    warn "Complete the installation and rerun this script"

    exit 1
fi

if ! command -v brew &>/dev/null; then
    log "Installing Homebrew"

    NONINTERACTIVE=1 /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

log "Updating Homebrew"

brew update
brew upgrade

chmod +x ./*.sh

./brew-packages.sh
./brew-casks.sh
./dotfiles.sh
./git-config.sh
./macos-defaults.sh

log "Bootstrap complete"

echo
echo "Restart your machine."