#!/bin/bash

# Install homebrew
if ! command -v brew &> /dev/null
then
    echo "Install homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install latest version of vim
brew install vim --with-override-system-vi

# Install tmux
# brew install tmux

# Install the_silver_searcher
brew install the_silver_searcher

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install watchman - useful for coc - https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#optional-install-watchman-for-file-watching
# brew install watchman

# Install packer
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ripgrep
brew install ripgrep

# Install fd
brew install fd

# install dasel
brew install dasel
