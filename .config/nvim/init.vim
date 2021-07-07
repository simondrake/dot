source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/vimspector.vim

luafile $HOME/.config/nvim/lua/init.lua

autocmd BufWritePre *.go lua goimports(1000)
