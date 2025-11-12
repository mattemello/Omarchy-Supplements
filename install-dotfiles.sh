#!/bin/sh

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/mattemello/.dotfiles.git"
REPO_NAME=."dotfiles"

if ! command -v stow &> /dev/null; then
    echo "Install stow first"
    exit 1
fi

cd ~

if [ -d "$REPO_NAME" ]; then
    echo "Repository '$REPO_NAME' already exist. skipping clone"
else
    git clone "$REPO_URL"
fi

if [ $? -eq 0 ]; then
    echo "removing old config"
    rm -rf ~/.config/nvim ~/.local/share/nvim/ ~/.cache/nvim/

    cd "$REPO_NAME"
    stow zshrc
    stow tmux

    cd "nvim/.config/nvim"
    git switch fasterNvim
    cd ../../..

    stow nvim
else
    echo "Failed to clone the repository."
    exit 1
fi
