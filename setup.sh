#!/bin/bash

# Install zsh
if ! command -v zsh &> /dev/null
then
    echo "Install zsh before running this script"
    exit 1
fi

if [[ $SHELL != "/usr/bin/zsh" ]]; then
    echo "Set your shell to zsh before running this script"
    exit 0
fi

# Install homebrew
if ! command -v brew &> /dev/null
then
    echo "Install homebrew before running this script"
    exit 1
fi

echo "======================================"
echo "Installing vim"
echo "======================================"

# Install latest version of vim
brew install vim

echo "======================================"
echo "Installing tmux"
echo "======================================"

# Install tmux
brew install tmux

echo "======================================"
echo "Installing ag"
echo "======================================"

# Install the_silver_searcher
brew install the_silver_searcher

echo "======================================"
echo "Installing zsh-autosuggestions"
echo "======================================"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "======================================"
echo "Installing zsh-syntax-highlighting"
echo "======================================"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "======================================"
echo "Installing zsh-completions"
echo "======================================"


# Install zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

echo "======================================"
echo "Installing packer"
echo "======================================"

# Install packer
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "======================================"
echo "Installing ripgrep"
echo "======================================"

# Install ripgrep
brew install ripgrep

echo "======================================"
echo "Installing fd"
echo "======================================"

# Install fd
brew install fd

echo "======================================"
echo "Installing dasel"
echo "======================================"

# install dasel
brew install dasel

echo "======================================"
echo "Installing coreutils"
echo "======================================"

brew install coreutils
