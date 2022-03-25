--################
--> Plugins
--################
require('plugins/plugins')

--################
--> Plugin Configuration
--################
-- require('plugins/lualine')
require('plugins/feline')
require('plugins/gps')

require('plugins/rhubarb')
require('plugins/treesitter')

--require('plugins/gitgutter')
require('plugins/gitsigns')

require('plugins/telescope')
require('plugins/nvim-cmp')


--################
--> LSP
--################
require('lsp/on_attach')
require('lsp/lsp')
require('lsp/go')

--################
--> Mappings
--################
require('mappings/trouble')
