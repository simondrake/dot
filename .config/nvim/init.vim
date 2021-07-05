lua require('plugins')

" automatically run :PackerCompile whenever plugins.lua is updated
autocmd BufWritePost plugins.lua PackerCompile

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/vimspector.vim

