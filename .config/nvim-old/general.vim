 " Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start  " Makes backspace key more powerful.
set noerrorbells                " No beeps
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set number                      " Show line numbers
" set relativenumber              " Setting number and relativenumber enables hybrid mode
set splitbelow                  " Horizontal windows should split to bottom
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set ignorecase                  " Search case insensitive...
set completeopt=menuone,noselect
set cursorline                  " Highlight the line containing the cursor
set t_Co=256
" set redrawtime=10000
set updatetime=100
" set hlsearch                    " Highlight found searches - enable this OR nohlsearch
set nohlsearch                 " Don't highlight found searches - enable this OR hlsearch

" colorscheme
" let g:tokyodark_transparent_background = 0
" let g:tokyodark_enable_italic_comment = 1
" let g:tokyodark_enable_italic = 1
" let g:tokyodark_color_gamma = "1.0" 		" Adjust the brightness
" colorscheme tokyodark

let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_transparent_bg = 0
" let g:gruvbox_contrast_light = "soft"
let g:gruvbox_contrast_light = "medium"
" let g:gruvbox_contrast_light = "hard"

" set background=dark    " Setting dark mode
set background=light   " Setting light mode
colorscheme gruvbox

" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

" augroup plugin_initialize
"     autocmd!
"     autocmd VimEnter * call FckThatMatchParen()
" augroup END

" make the cursor nice
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

set mouse+=a " Don't select/copy line numbers
" set clipboard^=unnamed,unnamedplus

let mapleader = ","

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * match

"=======================================
" Search and Replace {
"=======================================

" ReplaceGlobal finds each occurence of {pattern} (all lines) and replaces it
" with {replacement}
fu! ReplaceGlobal(pattern, replacement)
    exec('%s/' . a:pattern . '/' . a:replacement . '/g')
endfun
" Allows usage of ':ReplaceGlobal <arg1> <arg2>' instead of ':call ReplaceGlobal("arg1", "arg2")'
" f-args
:command! -nargs=* ReplaceGlobal call ReplaceGlobal(<f-args>)


" ReplaceLine finds each occurence of {pattern} (current lines) and replaces it
" with {replacement}
fu! ReplaceLine(pattern, replacement)
    exec('s/' . a:pattern . '/' . a:replacement . '/g')
endfun
:command! -nargs=* ReplaceLine call ReplaceLine(<f-args>)

" ReplaceQuickfix uses the cdo command to replace each occurence {pattern} and
" replaces it with {replacement} in the quickfix window
fu! ReplaceQuickfix(pattern, replacement)
    exec('cdo s/' . a:pattern . '/' . a.replacement . '/g | update')
endfun

"=======================================
" }
"=======================================



" function to trim trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
" allow usage of :TrimWhitespace instead of :call TrimWhitespace()
command! TrimWhitespace call TrimWhitespace()

" Strip whitespace on save
autocmd BufWritePre * TrimWhitespace

" Show whitespace characters
" set list
" set listchars=tab:???\ ,eol:???,nbsp:???,trail:???,extends:???,precedes:???,space:.

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


" If you don't want to exclude hidden files, use the following command
" --files-with-matches only print filenames with matches
" --ignore-case ignore case
" --skip-vcs-ignore skip Ignore VCS ignore files (e.g. .gitignore)
" --hidden search hidden files
" --ignore ignore files/directories matching pattern
let $FZF_DEFAULT_COMMAND='ag --files-with-matches --ignore-case --skip-vcs-ignore --hidden --ignore .git'
