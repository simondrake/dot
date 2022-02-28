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

-- nvim_lsp.gopls.setup {
--   root_dir = util.root_pattern("go.mod", ".git"),
--   settings = {
--     gopls = {
--       -- usePlaceholders = false,
--       buildFlags =  {"-tags=integration"},
--       -- gofumpt = true,
--       ["local"] = "cd.splunkdev.com",
--       -- experimentalPostfixCompletions = true,
--       analyses = {
--         unreachable = true,
--         unusedparams = true,
--         nilness = true,
--         shadow = true,
--       },
--       staticcheck = true,
--     }
--   },
-- }

configs.gopls = {
  default_config = {
    cmd = { "gopls" },
    filetypes = { 'go', 'gomod', 'gotmpl' },
    root_dir = function(fname)
      return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
    end,
    single_file_support = true,
    settings = {
      gopls = {
        buildFlags = {"-tags=integration" },
        ["local"] = "cd.splunkdev.com",
      }
    }
  }
}

local servers = { "gopls" }
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
