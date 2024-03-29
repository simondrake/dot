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
" set ignorecase                   	" Search case insensitive
set noignorecase                   	" Search case sensitive
set cursorline                   	" Highlight the line containing the cursor
set completeopt=menuone,noselect 	" Completion Preview
" set hlsearch                    	" Highlight found searches - enable this OR nohlsearch
set nohlsearch                    	" Don't highlight found searches - enable this OR hlsearch
set mouse+=a                      	" Don't select/copy line numbers
set signcolumn=yes                	" Always show sign columns - avoids "stuttering" behaviour on change

" set noexpandtab                     " Make sure that every file uses real tabs, not spaces
set expandtab                     	" Use spaces, not tabs
set shiftround                      " Round indent to multiple of 'shiftwidth'
set smartindent                     " Do smart indenting when starting a new line
set autoindent                      " Copy indent from current line, over to the new line

set nobackup
set noswapfile
set undofile

set cmdheight=2

filetype plugin on
syntax on

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

set noshowmode                    	" Turn off the default mode indicator (INSERT etc) as it's handled by the statusline

let mapleader = ","

set termguicolors

"--- Theme ---"
""" Gruvbox
" let g:gruvbox_italic = 1
" let g:gruvbox_italicize_comments = 1
" let g:gruvbox_transparent_bg = 0
" let g:gruvbox_contrast_light = "medium"
" set background=dark    " Setting dark mode
"set background=light   " Setting light mode
"colorscheme gruvbox

" colorscheme kanagawa

""" Git Diff
"""" cterm - sets the style
"""" ctermfg - set the text color
"""" ctermbg - set the highlighting
"""" DiffAdd - line was added
"""" DiffDelete - line was removed
"""" DiffChange - part of the line was changed (highlights the whole line)
"""" DiffText - the exact part of the line that changed
" hi! DiffAdd 		gui=NONE guifg=black ctermfg=0 guibg=#c9ebc0 ctermbg=Black
" hi! DiffDelete 	gui=NONE guifg=black ctermfg=0 guibg=#f7cfbf ctermbg=Black
" hi! DiffChange 	gui=NONE guifg=black ctermfg=0 guibg=#d2e1e0 ctermbg=Black
" hi! DiffText 		gui=NONE guifg=black ctermfg=0 guibg=#d2e1e0 ctermbg=Black

" hi! link GitGutterAdd DiffAdd
" hi! link GitGutterChange DiffChange
" hi! link GitGutterDelete DiffDelete

set tabpagemax=50

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

" map 'T :e ~/todo.md<cr>
" map 'N :e ~/notes.md<cr>

" Splits
nnoremap <C-H> <C-W><C-H> " LEFT - ctrl-h instead of ctrl-w then h
nnoremap <C-J> <C-W><C-J> " DOWN - ctrl-j instead of ctrl-w then j
nnoremap <C-K> <C-W><C-K> " UP - ctrl-k instead of ctrl-w then k
nnoremap <C-L> <C-W><C-L> " RIGHT - ctrl-l instead of ctrl-w then l

" invoke with '-'
" nmap  -  <Plug>(choosewin)
" if you want to use overlay feature
" let g:choosewin_overlay_enable = 1

" Map escape work properly in terminal mode
tnoremap <Esc> <C-\><C-n>

" fzf
nnoremap <leader>ff <cmd>Files <CR>
" Files in the current files directory
nnoremap <leader>fd <cmd>Files %:p:h<CR>

" Telescope
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden','--no-ignore-vcs', '-g', '!.git', }})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Find references, excluding test files
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references({file_ignore_patterns = { "%_test.go" } })<cr>
" Find references, including test files
nnoremap <leader>gr <cmd>lua require('telescope.builtin').lsp_references()<cr>

"================================
" Autocmds
"================================
"### Use relative numbers in normal mode; absolute numbers everywhere else.
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"================================
" Lua
"================================

luafile $HOME/.config/nvim/lua/init.lua
