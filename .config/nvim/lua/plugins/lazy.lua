vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	-- Theme
	{
		"rebelot/kanagawa.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
	},

	-- Testing (things I'm not sure if I'll keep yet) {
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {},
	},
	-- }

	-- Local Development {
	-- { dir = "~/development/personal/neovim/plugins/toggle_export" },
	-- { dir = "~/development/personal/neovim/plugins/decorated_yank", dependencies = { "nvim-lua/plenary.nvim" } },
	-- {
	--   dir = '~/development/personal/neovim/plugins/gomodifytags',
	--   dependencies = { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	--   opts = {
	--     override = true,
	--     options = { "json=omitempty" },
	--     parse = { enabled = true, },
	--   },
	-- },
	-- }

	-- Git {
	{ "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "shumphrey/fugitive-gitlab.vim" },
	-- }

	-- General {
	{ "tpope/vim-sensible" },
	{ "mg979/vim-visual-multi", branch = "master" },
	{ "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	{ "simondrake/decorated_yank", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "simondrake/toggle_export" },
	{
		"simondrake/gomodifytags",
		opts = {
			override = true,
			options = { "json=omitempty" },
			parse = { enabled = true },
		},
	},
	-- }

	-- Searching/Navigating {
	{ "mileszs/ack.vim" },
	{ "junegunn/fzf", build = "./install --bin" },
	{ "junegunn/fzf.vim" },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	-- }

	-- Neovim 0.5 {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "lukas-reineke/indent-blankline.nvim" },

	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	-- }

	-- lsp {
	{ "neovim/nvim-lspconfig" },
	{ "onsails/lspkind-nvim" },
	-- }

	-- Formatting {
	{ "windwp/nvim-autopairs" },
	{ "tpope/vim-commentary" },

	-- Snippets {
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{ "rafamadriz/friendly-snippets" },
	-- }

	-- Lualine
	{ "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons", opt = true } },
	{ "SmiteshP/nvim-navic", dependencies = "neovim/nvim-lspconfig" },
	{ "arkav/lualine-lsp-progress" },
	-- }

	-- Language Support {
	{
		"stevearc/conform.nvim",
		-- opts = {
		-- 	formatters_by_ft = {
		-- 		lua = { "stylua" },
		-- 		json = { "prettier" },
		-- 		markdown = { "prettier" },
		-- 		sh = { "shfmt", "shellharden" },
		-- 		yaml = { "prettier" },
		-- 		-- Conform will run multiple formatters sequentially
		-- 		-- go = { "gofumpt", "goimports" },
		-- 		-- Use a sub-list to run only the first available formatter
		-- 		javascript = { { "prettierd", "prettier" } },
		-- 		-- Use the "*" filetype to run formatters on all filetypes.
		-- 		["*"] = { "codespell", "trim_whitespace" },
		-- 	},
		-- 	format_on_save = {
		-- 		-- These options will be passed to conform.format()
		-- 		timeout_ms = 500,
		-- 		lsp_fallback = true,
		-- 	},
		-- },
	},
	{ "rodjek/vim-puppet" },
	{ "hashivim/vim-terraform" },
	{ "google/vim-jsonnet" },
	{ "uarun/vim-protobuf" },
	{ "bufbuild/vim-buf" },
	{ "tsandall/vim-rego" },
	{ "vim-test/vim-test" },
	{ "terrastruct/d2-vim" },
	-- Markdown
	{ "dhruvasagar/vim-table-mode" },
	-- Rust
	{ "simrat39/rust-tools.nvim" },

	-- }

	-- Debugging {
	{ "mfussenegger/nvim-dap" },
	{ "leoluz/nvim-dap-go" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	{ "theHamsta/nvim-dap-virtual-text" },
	-- }
})
