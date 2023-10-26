--################
--> lazy.nvim
--################
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("plugins/lazy")

--################
--> Plugin Configuration
--################
require("plugins/lualine")
require("plugins/rhubarb")
require("plugins/treesitter")
require("plugins/gitsigns")
require("plugins/telescope")
require("plugins/nvim-cmp")
require("plugins/commentary")
require("plugins/choosewin")
require("plugins/trouble")
require("plugins/vim-rego")
require("plugins/rust-tools")
require("plugins/vim-markdown")
-- require('plugins/hardtime')
require("plugins/decorated_yank")
require("plugins/gomodifytags")
require("plugins/conform-nvim")

-- require('plugins/dap').setup()

--################
--> LSP
--################
require("lsp/on_attach")
require("lsp/lsp")

--################
--> Mappings
--################
require("mappings/trouble")
require("mappings/dap")
require("mappings/choosewin")
require("mappings/general")

--################
--> Autocommands
--################
require("autocommands")

--################
--> Commands
--################
require("commands/general")

--################
--> functions
--################
require("functions/general")

require("gomodifytags").setup()
