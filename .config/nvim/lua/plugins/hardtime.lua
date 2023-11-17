local opts = {
  disable_mouse = true,
  disabled_keys = {
    ["<Up>"] = {},
    ["<Down>"] = {},
    ["<Left>"] = {},
    ["<Right>"] = {},
  },
}
require("hardtime").setup(opts)
