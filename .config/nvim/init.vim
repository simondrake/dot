"================================
" Settings
"================================

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start  	" Makes backspace key more powerful.
set noerrorbells                	" No beeps
set number                      	" Show line numbers
set splitright                  	" Vertical windows should be split to right
set splitbelow                  	" Horizontal windows should split to bottom
set fileformats=unix,dos,mac    	" Prefer Unix over Windows over OS 9 formats
set ignorecase                   	" Search case insensitive...
set cursorline                   	" Highlight the line containing the cursor
set completeopt=menuone,noselect 	" Completion Preview
" set hlsearch                    " Highlight found searches - enable this OR nohlsearch
set nohlsearch                 " Don't highlight found searches - enable this OR hlsearch
set mouse+=a " Don't select/copy line numbers

let mapleader = ","

"--- Theme ---"
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_transparent_bg = 0
let g:gruvbox_contrast_light = "medium"
" set background=dark    " Setting dark mode
set background=light   " Setting light mode
colorscheme gruvbox

" If you don't want to exclude hidden files, use the following command
" --files-with-matches only print filenames with matches
" --ignore-case ignore case
" --skip-vcs-ignore skip Ignore VCS ignore files (e.g. .gitignore)
" --hidden search hidden files
" --ignore ignore files/directories matching pattern
let $FZF_DEFAULT_COMMAND='ag --files-with-matches --ignore-case --skip-vcs-ignore --hidden --ignore .git'

"================================
" Mappings
"================================

" Type          | Definition
" ---------------------------
" nnoremap      | Normal mode map.
" inoremap      | Insert mode map.
" tnoremap      | Terminal mode map.
" ======================================================
"
" Mode letters:
"
" Letter        | Definition
" ---------------------------
" n             | Normal only
" v             | Visual and Select
" o             | Operator-pending
" x             | Visual only
" s             | Select only
" i             | Insert
" c             | Command-line
" l             | Insert, Command-line, Regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)
" t             | Terminal


" Splits
nnoremap <C-H> <C-W><C-H> " LEFT - ctrl-h instead of ctrl-w then h
nnoremap <C-J> <C-W><C-J> " DOWN - ctrl-j instead of ctrl-w then j
nnoremap <C-K> <C-W><C-K> " UP - ctrl-k instead of ctrl-w then k
nnoremap <C-L> <C-W><C-L> " RIGHT - ctrl-l instead of ctrl-w then l

" Map escape work properly in terminal mode
tnoremap <Esc> <C-\><C-n>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden','--no-ignore-vcs', '-g', '!.git', }})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Find references, excluding test files
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references({file_ignore_patterns = { "%_test.go" } })<cr>
" Find references, including test files
nnoremap <leader>gr <cmd>lua require('telescope.builtin').lsp_references()<cr>

" List Navigation
" see :help quickfix for more
" 				Previous Entry
nnoremap <leader>j :cprevious<CR>
" 				Next Entry
nnoremap <leader>k :cnext<CR>
" 				Close the List window
nnoremap <leader>l :cclose<CR>

"================================
" Lua
"================================

luafile $HOME/.config/nvim/lua/init.lua


" goimports on save
autocmd BufWritePre *.go lua OrgImports(1000)
