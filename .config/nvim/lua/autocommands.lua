vim.api.nvim_create_augroup('bufcheck', {clear = true})
-- Return to last edit position when opening files
-- TODO - find a better way to center the buffer other than zz
vim.api.nvim_create_autocmd('BufReadPost',  {
    group    = 'bufcheck',
    pattern  = '*',
    callback = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
         vim.fn.setpos('.', vim.fn.getpos("'\""))
         vim.cmd('normal zz')
         vim.cmd('silent! foldopen')
      end
    end
})

vim.api.nvim_create_autocmd('FocusLost', {
    group   = 'bufcheck',
    pattern = '*',
    callback = function()
        vim.cmd('silent! wa')
    end
})

-- Strip trailing whitespaces on save
vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*", command = "%s/\\s\\+$//e" }
)

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell spelllang=en_gb" }
)

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('yank_highlight', {}),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
    end,
})
