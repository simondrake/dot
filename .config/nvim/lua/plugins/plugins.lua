vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Git {
  -- use { 'airblade/vim-gitgutter' }				-- git diff markers
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- git diff markets
  use { 'tpope/vim-fugitive' }					-- git wrapper
  use { 'tpope/vim-rhubarb' }					-- GitHub extension for fugitive
  use { 'shumphrey/fugitive-gitlab.vim' }			-- GitLab extension for fugitive
  --   }

  -- General {
  use { 'tpope/vim-sensible' }					-- Defaults
  use { 'mg979/vim-visual-multi', branch = 'master' }		-- Multiple cursors
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  } -- Diagnostics etc 
  -- }
  
  -- Neovim 0.5 {
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- Highlighting etc
  use { 'mfussenegger/nvim-lint' } 				-- Linter
  use { 'lukas-reineke/indent-blankline.nvim' }			-- Indent guides

  use { "hrsh7th/cmp-nvim-lsp" }				-- Lua completion
  use { "hrsh7th/cmp-path" }					-- Path completion
  use { "hrsh7th/cmp-buffer" }					-- Buffer completion
  use { "hrsh7th/cmp-cmdline" }					-- Command line completion
  use { "hrsh7th/nvim-cmp" }					-- Completion plugin
  -- }
  
  -- lsp {
  use { 'neovim/nvim-lspconfig' }				-- Common config for LSP
  use { 'onsails/lspkind-nvim' }				-- Pictograms
  -- }

  -- Formatting {
  use { 'windwp/nvim-autopairs' }
  use { 'tpope/vim-commentary' }
  -- }

  -- Snippets {
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'rafamadriz/friendly-snippets' }
  -- }

  -- Searching {
  use { 'mileszs/ack.vim' }
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  -- }

  -- UI {
  -- use { 'morhetz/gruvbox' }
  use { 'rebelot/kanagawa.nvim' }

  -- use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  -- use { 'arkav/lualine-lsp-progress' } -- LSP progress in lualine
  use { 'feline-nvim/feline.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  use { "SmiteshP/nvim-gps" }
  -- }
  
  -- Language Support {
  use { 'sheerun/vim-polyglot' }
  use { 'tsandall/vim-rego' }
  -- }


  -- Terminal {
  use { 'voldikss/vim-floaterm' }
  -- }

end)
