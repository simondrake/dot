vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- General {
   use { 'tpope/vim-sensible' }
   use { 'mg979/vim-visual-multi', branch = 'master' }
   use { 'tyru/current-func-info.vim' }
  -- }

  -- Formatting {
   use { 'bronson/vim-trailing-whitespace' }
--   use { 'tmsvg/pear-tree' } -- Auto-pair brackets
   use { 'tpope/vim-sleuth' } -- Auto detect indentation settings
   use { 'vim-scripts/tComment' }
  -- }

  -- Snippets {
    use { 'hrsh7th/vim-vsnip' }
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
  use { 'preservim/nerdtree' }
  -- }

  -- Tools {
  use { 'godlygeek/tabular' }
  -- }

  -- UI {
  use { 'tiagovla/tokyodark.nvim' }
  use { 'monsonjeremy/onedark.nvim' }
  use {
  	'hoob3rt/lualine.nvim',
  	requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use { 'tpope/vim-fugitive' }
  use { 'kien/rainbow_parentheses.vim' }
  -- }

  -- Language Support
  use { 'plasticboy/vim-markdown', ft = { 'markdown' }} -- Only load for markdown filetypes

  -- Debugging {
    use { 'puremourning/vimspector' }
  -- }
end)

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

require('partials/lsp')
require('partials/completion')
require('partials/lualine')
require('partials/nerdtree')
require('partials/rhubarb')
require('partials/peartree')
require('partials/vimspector')
