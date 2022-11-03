-- :help key-notation
--<S-...>  shift-key                      shift <S-
--<C-...>  control-key                    control ctrl <C-
--<M-...>  alt-key or meta-key            meta alt <M-
--<A-...>  same as <M-...>                <A-
--<D-...>  command-key (Macintosh only)   <D-

local opts = { silent=true, noremap=true }
vim.api.nvim_set_keymap("n", "<S-o>", ":lua require('bufjump').backward()<cr>", opts)
vim.api.nvim_set_keymap("n", "<S-i>", ":lua require('bufjump').forward()<cr>", opts)
