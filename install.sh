#!/usr/bin/env bash

## Auto install all configs

# Install powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Install oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy .zshrc

cp .zshrc ~/

# Install Brew 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Packages

brew bundle

# Setup neovim and other configs

cp -r .config/* ~/.config/

# Setup neovim

nvim +KnidInstall

# Copy .gitignore_global

cp .gitignore_global ~/
