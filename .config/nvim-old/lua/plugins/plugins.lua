vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Git {
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }
  use { 'shumphrey/fugitive-gitlab.vim' }
  --   }

  -- General {
  use { 'tpope/vim-sensible' }
  use { 'mg979/vim-visual-multi', branch = 'master' }
   -- use { 'tyru/current-func-info.vim' }
  -- }

  -- Neovim 0.5 {
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Post-install/update hook with neovim command
  use { 'mfussenegger/nvim-lint' }
  use { 'lukas-reineke/indent-blankline.nvim' }

  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/nvim-cmp" }
  -- }

  -- lsp {
  -- use { 'ray-x/lsp_signature.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  -- }

  -- Formatting {
   -- use { 'bronson/vim-trailing-whitespace' }
   -- use { 'tmsvg/pear-tree' } -- Auto-pair brackets
   -- use { 'tpope/vim-sleuth' } -- Auto detect indentation settings
   use { 'vim-scripts/tComment' }
   use { 'windwp/nvim-autopairs' }
  -- }

  -- Snippets {
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    -- use { 'hrsh7th/vim-vsnip-integ' }
    use { 'rafamadriz/friendly-snippets' }
  -- }


  -- Searching {
  -- use { 'junegunn/fzf', run = './install --bin' }
  -- use { 'junegunn/fzf.vim' }
  use { 'mileszs/ack.vim' }
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use { "AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end }
  -- }

  -- Navigation {
  -- use { 'preservim/nerdtree' }
  -- }

  -- Tools {
  -- use { 'godlygeek/tabular' }
  -- }

  -- UI {
  use { 'simondrake/tokyodark.nvim' }
  use { 'morhetz/gruvbox' }
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  -- use { 'norcalli/nvim-colorizer.lua' }
  -- }

  -- Language Support
  -- use { 'plasticboy/vim-markdown', ft = { 'markdown' }} -- Only load for markdown filetypes
  -- use { 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = { 'nvim-lua/plenary.nvim' }, ft = { 'javascript' } }
  use { 'sheerun/vim-polyglot' }

  -- Debugging {
  -- use { 'puremourning/vimspector' }
  -- }

end)
