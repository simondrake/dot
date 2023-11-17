vim.api.nvim_set_keymap("n", "<F5>", ":lua require('dap').continue()<CR>", {silent = true, noremap = true} )
vim.api.nvim_set_keymap("n", "<F10>", ":lua require('dap').step_over()<CR>", {silent = true, noremap = true} )
vim.api.nvim_set_keymap("n", "<F11>", ":lua require('dap').step_into()<CR>", {silent = true, noremap = true} )
-- vim.api.nvim_set_keymap("n", "<F12>", ":lua require('dap').step_out()<CR>", {silent = true, noremap = true} )

vim.api.nvim_set_keymap("n", "<Leader>tb", ":lua require('dap').toggle_breakpoint()<CR>", {silent = true, noremap = true} )
vim.api.nvim_set_keymap("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", {silent = true, noremap = true} )

-- dap-go
vim.api.nvim_set_keymap("n", "<leader>td", ":lua require('dap-go').debug_test()<CR>", {silent = true, noremap = true} )

vim.api.nvim_set_keymap("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", {silent = true, noremap = true} )
vim.api.nvim_set_keymap("n", "<Leader>dr", ":lua require('dap').repl.open()<CR>", {silent = true, noremap = true} )
vim.api.nvim_set_keymap("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", {silent = true, noremap = true} )


-- Generally don't use these, but keep them just in case
vim.api.nvim_set_keymap("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", {silent = true, noremap = true} )
vim.api.nvim_set_keymap("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", {silent = true, noremap = true} )
vim.api.nvim_set_keymap("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", {silent = true, noremap = true} )
