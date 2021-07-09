source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/vimspector.vim

luafile $HOME/.config/nvim/lua/init.lua

" autocmd BufWritePre *.go lua goimports(1000) -- Don't use unless you read https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-866632451
autocmd BufWritePre *.go lua OrgImports(1000)
