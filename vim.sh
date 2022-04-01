#!/bin/bash

# Install neovim
brew install neovim

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# coc installs (advice from :CheckHealth)
# Make sure permissions are correct first
#sudo chown -R $USER /Library/Python
#pip3 install pynvim

# Make sure permissions are correct first
sudo chown -R $USER /usr/local/lib/node_modules
npm install -g neovim

# fzf
brew install fzf
# install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Install vim-language-server
npm install -g vim-language-server
