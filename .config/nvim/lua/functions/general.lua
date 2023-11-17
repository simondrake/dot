local M = {}

local util = require("vim.lsp.util")
local api = vim.api

vim.lsp.handlers["textDocument/references"] = function(_, result, ctx, config)
	if not result or vim.tbl_isempty(result) then
		vim.notify("No references found")
	else
		local client = vim.lsp.get_client_by_id(ctx.client_id)
		config = config or {}
		local title = "References"
		local items = util.locations_to_items(result, client.offset_encoding)

		if #items == 2 then
			if items[1].lnum == vim.api.nvim_win_get_cursor(0)[1] then
				vim.cmd("e " .. items[2].filename .. "|" .. items[2].lnum)
			else
				vim.cmd("e " .. items[1].filename .. "|" .. items[1].lnum)
			end
		else
			if config.loclist then
				vim.fn.setloclist(0, {}, " ", { title = title, items = items, context = ctx })
				api.nvim_command("lopen")
			elseif config.on_list then
				assert(type(config.on_list) == "function", "on_list is not a function")
				config.on_list({ title = title, items = items, context = ctx })
			else
				vim.fn.setqflist({}, " ", { title = title, items = items, context = ctx })
				api.nvim_command("botright copen")
			end
		end
	end
end

-- If wait_ms is nil, vim.lsp.buf_request_sync defaults to 1000ms.
M.goimports = function(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for cid, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
				vim.lsp.util.apply_workspace_edit(r.edit, enc)
			end
		end
	end
end

return M
