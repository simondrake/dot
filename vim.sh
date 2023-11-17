#!/bin/bash

echo "======================================"
echo "Installing neovim"
echo "======================================"

# Install neovim
brew install neovim

# Make sure permissions are correct first
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

npm install -g neovim

echo "======================================"
echo "Installing fzf"
echo "======================================"

# fzf
brew install fzf
# install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

echo "======================================"
echo "Installing vim-language-server"
echo "======================================"

# Install vim-language-server
npm install -g vim-language-server
