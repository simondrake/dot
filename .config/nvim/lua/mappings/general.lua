local opts = { silent=true, noremap=true }

vim.api.nvim_set_keymap("n", "'T", ":e ~/todo.md<cr>", opts)
vim.api.nvim_set_keymap("n", "'N", ":e ~/notes.md<cr>", opts)

vim.api.nvim_set_keymap("v", "<C-y>", "<cmd>DecoratedYank<cr>", opts)
