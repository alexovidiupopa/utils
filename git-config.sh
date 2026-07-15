#!/usr/bin/env bash

set -euo pipefail

source ./lib.sh

log "Configuring Git"

read -rp "Git name: " GIT_NAME
read -rp "Git email: " GIT_EMAIL

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

git config --global init.defaultBranch main
git config --global pull.rebase false

git config --global core.editor nvim
git config --global core.autocrlf input

git config --global fetch.prune true
git config --global push.autoSetupRemote true
git config --global rerere.enabled true

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch

git config --global alias.lg \
    "log --graph --decorate --oneline --all"

log "Git configuration complete"