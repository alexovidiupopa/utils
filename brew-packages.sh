#!/usr/bin/env bash

set -euo pipefail

source ./lib.sh

log "Installing command-line packages"

brew install \
    git \
    gh \
    git-lfs \
    curl \
    wget \
    jq \
    yq \
    tree \
    htop \
    btop \
    tmux \
    vim \
    neovim \
    bash \
    zsh \
    coreutils \
    gnu-sed \
    findutils \
    make \
    cmake \
    ninja \
    pkg-config \
    openssl \
    gnupg \
    unzip \
    zip \
    rsync \
    ripgrep \
    fd \
    fzf \
    watch \
    bat \
    eza \
    zoxide \
    starship

log "Installing Java"

if brew info openjdk@25 &>/dev/null; then
    brew install openjdk@25
else
    brew install openjdk
fi

log "Installing programming languages"

brew install \
    python \
    go \
    node \
    pnpm \
    yarn \
    maven \
    gradle \
    rustup \
    protobuf \
    grpcurl

log "Installing containers and Kubernetes tooling"

brew install \
    docker \
    docker-compose \
    kubectl \
    helm \
    k9s \
    kind \
    minikube

# log "Installing infrastructure tooling"

# brew install \
#     terraform \
#     ansible

log "Installing networking tools"

brew install \
    nmap \
    iperf3 \
    tcpdump \
    telnet

log "Installing databases"

brew install \
    postgresql

log "Installing fonts"

brew tap homebrew/cask-fonts

brew install --cask \
    font-jetbrains-mono \
    font-fira-code \
    font-hack-nerd-font

if [[ "$(uname -m)" == "arm64" ]]; then
    log "Installing Rosetta"

    softwareupdate --install-rosetta --agree-to-license || true
fi

brew cleanup

log "Package installation complete"