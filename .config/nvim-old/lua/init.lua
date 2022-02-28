require('settings')

--################
--> Plugins
--################
require('plugins/plugins')
-- require('plugins/completion')
require('plugins/lualine')
-- require('plugins/nerdtree')
require('plugins/rhubarb')
require('plugins/peartree')
-- require('plugins/vimspector')
require('plugins/mappings')
require('plugins/treesitter')
-- require('plugins/colorizer')
require('plugins/vimsleuth')
-- require('plugins/vimmarkdown')
-- require('plugins/indent-blankline')
require('plugins/gitgutter')
require('plugins/telescope')
require('plugins/nvim-neoclip')
require('plugins/nvim-cmp')

--################
--> LSP
--################
require('lsp/lsp')
require('lsp/tsserver')
require('lsp/go')
-- go get github.com/mattn/efm-langserver
-- npm install -g eslint_d
require('lsp/efm')
