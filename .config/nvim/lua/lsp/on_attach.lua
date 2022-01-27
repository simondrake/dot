local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-y>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-y>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', 'ga', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  buf_set_keymap('n', 'E', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<C-s><C-s>', '<cmd>lua vim.lsp.buf.document_highlight()<CR>', opts)
  buf_set_keymap('n', '<C-s><C-h>', '<cmd>lua vim.lsp.buf.clear_references()<CR>', opts)
  buf_set_keymap('n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n', '<leader>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- workspace = true shows diagnostics for the whole project
  buf_set_keymap('n', 'Q', '<cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist = true, workspace = true, severity_limit = "Error" })<CR>', opts)
  -- show Errors and Warnings for the whole project
  buf_set_keymap('n', '<leader>Q', '<cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist = true, severity_limit = "Warning" })<CR>', opts)
  buf_set_keymap('n', '<leader>W', '<cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist = true, workspace = true, severity_limit = "Warning" })<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)')
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

return on_attach
