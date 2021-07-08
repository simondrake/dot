vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Git {
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }
  --   }

  -- General {
   use { 'tpope/vim-sensible' }
   use { 'mg979/vim-visual-multi', branch = 'master' }
   use { 'tyru/current-func-info.vim' }
  -- }

  -- Formatting {
   use { 'bronson/vim-trailing-whitespace' }
   use { 'tmsvg/pear-tree' } -- Auto-pair brackets
   -- use { 'tpope/vim-sleuth' } -- Auto detect indentation settings
   use { 'vim-scripts/tComment' }
  -- }

  -- Snippets {
    use { 'hrsh7th/vim-vsnip' }
    use { 'rafamadriz/friendly-snippets' }
  -- }

  -- Neovim 0.5 {
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Post-install/update hook with neovim command
  use { 'hrsh7th/nvim-compe' }
  use { 'onsails/lspkind-nvim' }
  -- }

  -- Searching {
  use { 'junegunn/fzf', run = vim.fn['fzf#install'] }
  use { 'junegunn/fzf.vim' }
  -- }

  -- Navigation {
  -- use { 'preservim/nerdtree' }
  -- }

  -- Tools {
  use { 'godlygeek/tabular' }
  -- }

  -- UI {
  use { 'tiagovla/tokyodark.nvim' }
  use { 'monsonjeremy/onedark.nvim' }
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  -- use { 'p00f/nvim-ts-rainbow' }
  -- }

  -- Language Support
  use { 'plasticboy/vim-markdown', ft = { 'markdown' }} -- Only load for markdown filetypes
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = { 'nvim-lua/plenary.nvim' }, ft = { 'javascript' }}
  use { 'sheerun/vim-polyglot' }

  -- Debugging {
  use { 'puremourning/vimspector' }
  -- }
end)
