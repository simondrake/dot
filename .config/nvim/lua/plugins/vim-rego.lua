local g = vim.g
g.formatdef_rego = '"opa fmt"'
g.formatters_rego = {"rego"}
g.autoformat_autoindent = 0
g.autoformat_retab = 0

g.neoformat_rego_opa = {
  exe = "opa",
  args = {"fmt"},
  stdin = 1,
}
g.neoformat_enabled_rego = {'opa'}

