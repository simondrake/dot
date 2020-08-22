" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Coc plugins
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-html',
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-go',
\ 'coc-css'
\ ]

call plug#begin('~/.config/nvim/plugged')
" Git {
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
" }

" General {
  Plug 'tpope/vim-sensible'		" Sensible Defaults
"  Plug 'terryma/vim-multiple-cursors' " Deprecated - https://github.com/terryma/vim-multiple-cursors/issues/314
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tyru/current-func-info.vim'
  Plug 'tpope/vim-surround'
" }

" Formatting {
  Plug 'bronson/vim-trailing-whitespace'	" Highlight whitespace
  Plug 'tmsvg/pear-tree'			" Auto-pair brackets
  Plug 'tpope/vim-sleuth'			" Auto detect indentation settings
  Plug 'vim-airline/vim-airline' 		" Statusline
  Plug 'kien/rainbow_parentheses.vim'
  " Plug 'tpope/vim-commentary'   " Comments
  Plug 'vim-scripts/tComment'
" }

" Snippets {
  Plug 'SirVer/ultisnips'
" }


" Searching {
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
" }

" Navigation {
  Plug 'preservim/nerdtree'
" }

" Theme {
  Plug 'arcticicestudio/nord-vim'
" }

" Language Support {
  Plug 'sheerun/vim-polyglot'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'google/vim-jsonnet'
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() } }
" }

" Testing {
  Plug 'vim-test/vim-test'
" }

" Debugging {
  Plug 'puremourning/vimspector'
" }

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 		Plugin Config
"
""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow_parentheses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ['brown',       'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0
" Disable fmt on save as it's handled by coc.nvim
" let g:go_fmt_autosave = 0
" run go imports on file save
let g:go_fmt_command = "goimports"
" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" disable (K) :GoDoc mapping to let coc.nvim handle it
let g:go_doc_keywordprg_enabled = 0
" Disable vim-go LSP support - let coc.nvim handle it
let g:go_gopls_enabled = 1
" disable vim-go :GoDef short cut (gd)
" this is handled by coc.nvim
let g:go_def_mapping_enabled = 0
" Temporary to test
let g:go_auto_type_info = 1     " show the type info (|:GoInfo|) for the word under the cursor automatically.
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nord
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nord_cursor_line_number_background = 1
let g:nord_italic_comments = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rhubarb
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:github_enterprise_urls = ['https://cd.splunkdev.com']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PearTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_map_special_keys = 0

" Ultisnips
""""""""""""""""""""""""""""
" NOT USED - Set-up in COC "
""""""""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>k :NERDTreeToggle<CR>
nnoremap <silent> <leader>y :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

