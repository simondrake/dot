
-- Reference to explain how to use lua to write autocmds
-- vim.api.nvim_command([[
-- augroup AutoCompileLatex
-- autocmd BufEnter *.tex :set wrap linebreak nolist spell
-- autocmd BufWritePost *.tex :silent !bibtex %:t:r > /dev/null
-- autocmd BufWritePost *.tex :silent !compiler % > /dev/null
-- augroup END 
-- ]])



-- Custom comment rules
-- Rego -> #
vim.api.nvim_command('autocmd FileType rego setlocal commentstring=#\\ %s')
-- go mod -> //
vim.api.nvim_command('autocmd FileType gomod setlocal commentstring=//\\ %s')
