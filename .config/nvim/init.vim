source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/vimspector.vim

" Go helpers
source $HOME/.config/nvim/go.vim
source $HOME/.config/nvim/go/tags.vim
source $HOME/.config/nvim/go/util.vim
source $HOME/.config/nvim/go/path.vim
source $HOME/.config/nvim/go/config.vim
source $HOME/.config/nvim/go/fillstruct.vim

luafile $HOME/.config/nvim/lua/init.lua

" autocmd BufWritePre *.go lua goimports(1000) -- Don't use unless you read https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-866632451
autocmd BufWritePre *.go lua OrgImports(1000)
