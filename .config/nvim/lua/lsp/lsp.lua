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
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      usePlaceholders = false,
      buildFlags =  {"-tags=integration"},
      gofumpt = true,
      ["local"] = "cd.splunkdev.com",
      -- experimentalPostfixCompletions = true,
      -- analyses = {
      --   unreachable = true,
      --   unusedparams = true,
      --   nilness = true,
      --   shadow = true,
      -- },
      -- staticcheck = true,
    }
  },
}

-- if not nvim_lsp.golangcilsp then
configs.golangcilsp = {
	default_config = {
		cmd = {'golangci-lint-langserver'},
		root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
		init_options = {
				command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--disable", "exhaustivestruct", "--disable", "gci", "--out-format", "json" };
		}
	};
}
-- end
nvim_lsp.golangcilsp.setup {
	filetypes = {'go'}
}

local servers = { "tsserver", "vim_language_server", "bashls", "dockerls", "html", "jsonls", "puppet" }
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
