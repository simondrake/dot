-- Taken from https://github.com/WhoIsSethDaniel/dotfiles/blob/9fa8cc081a99cef2fc20d8c4f7ebfb0abe93d029/.config/nvim/lua/plugins/conform-nvim.lua

-- https://github.com/stevearc/conform.nvim
local c = require("conform")

-- local get_current_gomod = function()
-- 	local file = io.open("go.mod", "r")
-- 	if file == nil then
-- 		return nil
-- 	end

-- 	local first_line = file:read()
-- 	local mod_name = first_line:gsub("module ", "")
-- 	file:close()
-- 	return mod_name
-- end

require("conform.formatters.shfmt").args = function()
	return { "-i=4", "-ci", "-s", "-bn" }
end

require("conform.formatters.golines").args = function()
	return { "--max-len=120" }
end

-- require("conform.formatters.gci").args = function()
-- 	return {
-- 		"write",
-- 		"--skip-generated",
-- 		"--skip-vendor",
-- 		"-s",
-- 		"standard",
-- 		"-s",
-- 		"default",
-- 		"-s",
-- 		"prefix(" .. get_current_gomod() .. ")",
-- 		"$FILENAME",
-- 	}
-- end

c.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettier" },
		markdown = { "prettier" },
		sh = { "shfmt", "shellharden" },
		yaml = { "prettier" },
		-- go = { "gci" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
		-- Use the "*" filetype to run formatters on all filetypes.
		["*"] = { "codespell", "trim_whitespace" },
	},
	format_on_save = function(bufnr)
		local ft = vim.bo[bufnr].filetype
		local to = 500
		local fb = true
		if ft == "go" then
			fb = "always"
		end
		return { timeout_ms = to, lsp_fallback = fb }
	end,
})
