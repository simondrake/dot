local funcs = require('functions/general')

vim.api.nvim_create_augroup('bufcheck', { clear = true })
-- Return to last edit position when opening files
-- TODO - find a better way to center the buffer other than zz
vim.api.nvim_create_autocmd('BufReadPost', {
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
  group    = 'bufcheck',
  pattern  = '*',
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
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your machine and
    -- codebase, you may want longer. Add an argument (e.g., 2000 or more) if
    -- you find that you have to write the file twice for changes to be saved.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end
})

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    -- Go files are handled in a different autocommand, so exclude to avoid
    -- two autocommands running on save
    if vim.bo.filetype == "go" then
      return
    end

    vim.lsp.buf.format()
  end
})
