#!/usr/bin/env bash

set -euo pipefail

source ./lib.sh

PROFILE="$HOME/.zprofile"

touch "$PROFILE"

append_if_missing() {
    grep -qxF "$1" "$PROFILE" || echo "$1" >> "$PROFILE"
}

log "Configuring shell"

if [[ "$(uname -m)" == "arm64" ]]; then
    append_if_missing 'eval "$(/opt/homebrew/bin/brew shellenv)"'
fi

append_if_missing 'export HOMEBREW_NO_ANALYTICS=1'

append_if_missing 'export EDITOR=nvim'

append_if_missing 'export PATH="$(brew --prefix)/bin:$PATH"'

append_if_missing 'export PATH="$HOME/.local/bin:$PATH"'

append_if_missing 'export GOPATH="$HOME/go"'
append_if_missing 'export PATH="$GOPATH/bin:$PATH"'

append_if_missing 'export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-25.jdk/Contents/Home/bin/java"'
append_if_missing 'export JDK_HOME="/Library/Java/JavaVirtualMachines/openjdk-25.jdk/Contents/Home/bin/"'
append_if_missing 'export PATH="$JDK_HOME:$PATH"'

append_if_missing 'eval "$(zoxide init zsh)"'
append_if_missing 'eval "$(starship init zsh)"'
append_if_missing 'source <(fzf --zsh)'

log "Creating workspace directories"

mkdir -p "$HOME/Workspace"
mkdir -p "$HOME/Workspace/work"
mkdir -p "$HOME/Workspace/personal"
mkdir -p "$HOME/Workspace/playground"

log "Shell configuration complete"