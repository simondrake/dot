" Custom Mappings
"=======================================================
" Type          | Definition
" ---------------------------
" nnoremap      | Normal mode map.
" inoremap      | Insert mode map.
" tnoremap      | Terminal mode map.
" ======================================================
"
" Mode letters:
" ======================================================
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
" ======================================================


" Map ctrl + f as :Ag -> Carriage Return
" nnoremap <silent> <C-F> :Ag<CR>
" Map ctrl + f as :Files -> Carriage Return
nnoremap <silent> <C-F> :Files<CR>
" Map <leader>r as :noh (clears search highlighting) -> Carriage Return
nnoremap <silent> <leader>r :noh<CR>

" NerdTree Mappings
" nnoremap <silent> <leader>k :NERDTreeToggle<CR>
" nnoremap <silent> <leader>y :NERDTreeFind<CR>

" Splits
nnoremap <C-H> <C-W><C-H> " LEFT - ctrl-h instead of ctrl-w then h
nnoremap <C-J> <C-W><C-J> " DOWN - ctrl-j instead of ctrl-w then j
nnoremap <C-K> <C-W><C-K> " UP - ctrl-k instead of ctrl-w then k
nnoremap <C-L> <C-W><C-L> " RIGHT - ctrl-l instead of ctrl-w then l
set splitbelow
set splitright

" current-func-info
nnoremap <silent> <leader>q :echo cfi#format("%s", "")<CR>

" Paste below
nmap <silent> ]p :pu<CR>
" Paste Above
nmap <silent> [p :pu!<CR>

" Map escape work properly in terminal mode
tnoremap <Esc> <C-\><C-n>

noremap <leader>y "*y
noremap <leader>yy "*yy
noremap <leader>yi "*yi

noremap <leader>p "*p
noremap <leader>pp "*pp
noremap <leader>pi "*pi

inoremap <leader>fs <esc>:GoFillStruct<CR>
nnoremap <leader>fs :GoFillStruct<CR>

nnoremap <leader>ta :GoAddTags
nnoremap <leader>tr :GoRemoveTags<CR>

" function! ProfileStart()
"   :profile start profile.log
"   :profile func *
"   :profile file *
" endfunction
"
" function! ProfileStop()
"   :profile stop
" endfunction

" List Navigation
" see :help quickfix for more
" 				Previous Entry
nnoremap <leader>j :cprevious<CR>
" 				Next Entry
nnoremap <leader>k :cnext<CR>
" 				Close the List window
nnoremap <leader>l :cclose<CR>
