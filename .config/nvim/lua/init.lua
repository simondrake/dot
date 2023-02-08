--################
--> Plugins
--################
require('plugins/plugins')

--################
--> Plugin Configuration
--################
require('plugins/lualine')
require('plugins/gps')
require('plugins/rhubarb')
require('plugins/treesitter')
require('plugins/gitsigns')
require('plugins/telescope')
require('plugins/nvim-cmp')
require('plugins/commentary')
require('plugins/choosewin')
require('plugins/trouble')

-- require('plugins/dap').setup()

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
require('mappings/dap')
require('mappings/choosewin')

--################
--> Autocommands
--################
require('autocommands')
