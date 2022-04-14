local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettierd.with {
      prefer_local = "node_modules/.bin",
    },
    formatting.black,
    diagnostics.flake8,
    codeactions.gitsigns,
  },
}
