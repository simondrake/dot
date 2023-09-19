local opts = { silent=true, noremap=true }

vim.api.nvim_set_keymap("n", "'T", ":e ~/todo.md<cr>", opts)
vim.api.nvim_set_keymap("n", "'N", ":e ~/notes.md<cr>", opts)

vim.keymap.set("v", "<C-y>", function() require('decorated_yank').decorated_yank_with_link() end)
