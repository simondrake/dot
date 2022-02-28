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


" Splits
nnoremap <C-H> <C-W><C-H> " LEFT - ctrl-h instead of ctrl-w then h
nnoremap <C-J> <C-W><C-J> " DOWN - ctrl-j instead of ctrl-w then j
nnoremap <C-K> <C-W><C-K> " UP - ctrl-k instead of ctrl-w then k
nnoremap <C-L> <C-W><C-L> " RIGHT - ctrl-l instead of ctrl-w then l
set splitbelow
set splitright

" Map escape work properly in terminal mode
tnoremap <Esc> <C-\><C-n>

inoremap <leader>fs <esc>:GoFillStruct<CR>
nnoremap <leader>fs :GoFillStruct<CR>

nnoremap <leader>ta :GoAddTags
nnoremap <leader>tr :GoRemoveTags<CR>


" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden','--no-ignore-vcs', '-g', '!.git', }})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Find references, excluding test files
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references({file_ignore_patterns = { "%_test.go" } })<cr>
" Find references, including test files
nnoremap <leader>gr <cmd>lua require('telescope.builtin').lsp_references()<cr>

