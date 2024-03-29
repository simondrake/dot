local on_attach = require("lsp.on_attach")

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local capabilities = require("cmp_nvim_lsp").default_capabilities() --nvim-cmp

local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")

nvim_lsp.vimls.setup({
	default_config = {
		cmd = { "vim-language-server", "--stdio" },
		filetypes = { "vim" },
		root_dir = function(fname)
			return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
		end,
		settings = {},
	},
})

local get_current_gomod = function()
	local file = io.open("go.mod", "r")
	if file == nil then
		return nil
	end

	local first_line = file:read()
	local mod_name = first_line:gsub("module ", "")
	file:close()
	return mod_name
end

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	-- cmd = { "gopls", "-rpc.trace", "-logfile", "/tmp/gopls.log", "serve" },
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	single_file_support = true,
	settings = {
		gopls = {
			buildFlags = { "-tags=integration,smoke" },
			["local"] = get_current_gomod(),
			experimentalPostfixCompletions = true,
			analyses = {
				nilness = true,
				shadow = true,
				unreachable = true,
				unusedparams = true,
				unusedvariable = true,
			},
			staticcheck = true,
			gofumpt = true,
			-- hints = {
			-- 	assignVariableTypes = true,
			-- 	compositeLiteralFields = true,
			-- 	constantValues = true,
			-- 	functionTypeParameters = true,
			-- 	parameterNames = true,
			-- 	rangeVariableTypes = true,
			-- },
		},
		init_options = {
			usePlaceholders = true,
		},
	},
})

-- ### Handled by rust-rools ###
-- nvim_lsp.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "rust-analyzer" },
--   filetypes = { "rust" },
--   root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
--   settings = {
--     ["rust-analyzer"] = {
--       imports = {
--         granularity = {
--             group = "module",
--         },
--         prefix = "self",
--       },
--       cargo = {
--         buildScripts = {
--             enable = true,
--         },
--       },
--       procMacro = {
--         enable = true
--       },
--     }
--     }
-- })

nvim_lsp.bufls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "bufls", "serve" },
	filetypes = { "proto" },
	root_dir = util.root_pattern("buf.work.yaml", ".git"),
})

nvim_lsp.tsserver.setup({
	on_attach = function(client, _)
		client.server_capabilities.documentFormattingProvider = false
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end,
})

nvim_lsp.lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
})

local servers = { "vimls", "terraformls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		root_dir = function(fname)
			return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
		end,
		flags = {
			debounce_did_change_notify = 250,
		},
	})
end

require("lspkind").init()
