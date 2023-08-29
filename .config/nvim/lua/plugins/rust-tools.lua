local rt = require("rust-tools")

local on_attach = require('lsp.on_attach')
local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

rt.setup({
  tools = {
    inlay_hints = {
      auto = false,
    }
  },
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
})
