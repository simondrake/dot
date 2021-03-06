vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Git {
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }         -- git diff markets
  use { 'tpope/vim-fugitive' }					                                            -- git wrapper
  use { 'tpope/vim-rhubarb' }					                                              -- GitHub extension for fugitive
  use { 'shumphrey/fugitive-gitlab.vim' }			                                      -- GitLab extension for fugitive
  --   }

  -- General {
  use { 'tpope/vim-sensible' }					                                            -- Defaults
  use { 'mg979/vim-visual-multi', branch = 'master' }		                            -- Multiple cursors
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }                                                                                 -- Diagnostics etc
  -- }

  -- Neovim 0.5 {
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }                      -- Highlighting etc
  use { 'mfussenegger/nvim-lint' } 				                                          -- Linter
  use { 'lukas-reineke/indent-blankline.nvim' }	                                		-- Indent guides

  use { "hrsh7th/cmp-nvim-lsp" }				                                            -- Lua completion
  use { "hrsh7th/cmp-path" }					                                              -- Path completion
  use { "hrsh7th/cmp-buffer" }					                                            -- Buffer completion
  use { "hrsh7th/cmp-cmdline" }					                                            -- Command line completion
  use { "hrsh7th/nvim-cmp" }					                                              -- Completion plugin
  -- }

  -- lsp {
  use { 'neovim/nvim-lspconfig' }				                                            -- Common config for LSP
  use { 'onsails/lspkind-nvim' }				                                            -- Pictograms
  -- }

  -- Formatting {
  use { 'windwp/nvim-autopairs' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-sleuth' }
  -- }

  -- Snippets {
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'rafamadriz/friendly-snippets' }
  -- }

  -- Searching {
  use { 'mileszs/ack.vim' }
  use { 'junegunn/fzf', run = './install --bin' }
  use { 'junegunn/fzf.vim' }
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'luukvbaal/nnn.nvim' }
  -- }

  -- UI {
  -- Themes
  -- use { 'morhetz/gruvbox' }
  use { 'rebelot/kanagawa.nvim' }

  use { "folke/twilight.nvim" }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }
  use { 'arkav/lualine-lsp-progress' } -- LSP progress in lualine
  -- }

  -- Language Support {
    -- use { 'sheerun/vim-polyglot' }
    use { 'rodjek/vim-puppet'}
    use { 'hashivim/vim-terraform'}
    use { 'google/vim-jsonnet'}
    use { 'uarun/vim-protobuf'}
    use { 'bufbuild/vim-buf'}
    use { 'tsandall/vim-rego'}
  -- }


  -- Terminal {
  use { 'voldikss/vim-floaterm' }
  -- }

  -- Debugging {
  use { 'mfussenegger/nvim-dap' }
  use { 'leoluz/nvim-dap-go' }
  use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
  use { 'theHamsta/nvim-dap-virtual-text' }
  -- }


  -- Journal {
  use { 'junegunn/goyo.vim' }
  use { 'junegunn/limelight.vim' }
  -- }
end)
