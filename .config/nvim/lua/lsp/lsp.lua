local on_attach = require('lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require "lspconfig/util"

nvim_lsp.vimls.setup {
  default_config = {
    cmd = { 'vim-language-server', '--stdio' };
    filetypes = { 'vim' };
    root_dir = function(fname)
      return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  --cmd = {"gopls", "-rpc.trace", "-logfile", "/tmp/gopls.log", "serve"},
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  single_file_support = true,
  settings = {
    gopls = {
      buildFlags = { "-tags=integration,smoke" },
      ["local"] = "cd.splunkdev.com",
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      }
    },
  },
}

-- nvim_lsp.sumneko_lua.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = {"lua-language-server"},
--   filetypes = {"lua"},
--   root_dir = util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", ".git"),
--   single_file_support = true,
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

local servers = { 'vimls', 'golangci_lint_ls', 'terraformls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function(fname)
      return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    flags = {
      debounce_did_change_notify = 250,
    };
  }
end

require('lspkind').init()
