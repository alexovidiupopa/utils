#!/usr/bin/env bash

set -euo pipefail

source ./lib.sh

log "Applying macOS defaults"

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

defaults write com.apple.finder AppleShowAllFiles -bool true

defaults write NSGlobalDomain AppleShowAllExtensions -bool true

defaults write com.apple.finder ShowPathbar -bool true

defaults write com.apple.finder ShowStatusBar -bool true

defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

defaults write com.apple.dock autohide -bool true

defaults write com.apple.dock show-recents -bool false

defaults write com.apple.dock tilesize -int 40

mkdir -p "$HOME/Screenshots"

defaults write com.apple.screencapture location \
    "$HOME/Screenshots"

defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

defaults write NSGlobalDomain \
    NSAutomaticSpellingCorrectionEnabled \
    -bool false

killall Finder || true
killall Dock || true
killall SystemUIServer || true

log "macOS defaults applied"