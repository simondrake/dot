" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection


set backspace=indent,eol,start  " Makes backspace key more powerful.
set laststatus=2                " Show status line always
set autoindent                  " Enable Autoindent
set incsearch                   " Shows the match while typing
set noerrorbells                " No beeps
set number                      " Show line numbers
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not if it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set cursorline                  " Highlight the line containing the cursor

" set hlsearch                    " Highlight found searches - enable this OR nohlsearch
set nohlsearch                 " Don't highlight found searches - enable this OR hlsearch

" make the cursor nice
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

if has('gui_running')
  set guifont=hermit
  " set guifont=Lucida_Console:h11
endif

" Strip whitespace on save
autocmd BufWritePre * FixWhitespace

set mouse+=a " Don't select/copy line numbers
" set clipboard^=unnamed,unnamedplus

let mapleader = ","

" Show whitespace characters
set list
set listchars=tab:>-

" <leader><number> to be taken to the desired window
" e.g. if the leader is the default '\\' then '\\2' will take you to the
" second split
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" Get window number
function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

" Show window number in statuslinei
" let g:airline_section_c = 'win:%{WindowNumber()} file:%<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%#__restore__# function: [%{cfi#format("%s", "")}]'
let g:airline_section_c = 'win:%{WindowNumber()} file:%<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%#__restore__#'

" Theme
colorscheme nord
"hi SpecialKey ctermfg=8

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab


" Set comment colour to LightBlue
hi Comment ctermfg=LightBlue

" If you don't want to exclude hidden files, use the following command
" --files-with-matches only print filenames with matches
" --ignore-case ignore case
" --skip-vcs-ignore skip Ignore VCS ignore files (e.g. .gitignore)
" --hidden search hidden files
" --ignore ignore files/directories matching pattern
let $FZF_DEFAULT_COMMAND='ag --files-with-matches --ignore-case --skip-vcs-ignore --hidden --ignore .git'
