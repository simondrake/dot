local on_attach = require('lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require "lspconfig/util"

configs.vim_language_server = {
  default_config = {
    cmd = {'vim-language-server', '--stdio'};
    filetypes = {'vim'};
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
  cmd = {"gopls", "serve"},
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  single_file_support = true,
  settings = {
    gopls = {
      buildFlags =  {"-tags=integration"},
      ["local"] = "cd.splunkdev.com",
    }
  },
}

local servers = { }
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
