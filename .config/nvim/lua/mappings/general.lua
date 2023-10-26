local opts = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "'T", ":e ~/todo.md<cr>", opts)
vim.api.nvim_set_keymap("n", "'N", ":e ~/notes.md<cr>", opts)

vim.keymap.set("v", "<C-y>", function()
	require("decorated_yank").decorated_yank_with_link()
end)

vim.keymap.set("n", "TE", function()
	require("toggle_export").ToggleExport()
end)

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })

vim.keymap.set("n", "<leader>hh", "<cmd>HopWord<CR>", { desc = "Center cursor after moving up half-page" })
