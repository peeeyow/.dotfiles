local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions
local default_diagnostic_format = "#{m}\n(#{c})"

null_ls.setup {
  debug = false,
  sources = {
    formatting.black,
    formatting.isort,
    formatting.prettierd,
    formatting.stylua,
    diagnostics.eslint_d.with {
      diagnostics_format = default_diagnostic_format,
    },
    diagnostics.flake8.with {
      diagnostics_format = default_diagnostic_format,
    },
    diagnostics.mypy.with {
      diagnostics_format = default_diagnostic_format,
    },
    codeactions.gitsigns,
    codeactions.eslint_d,
  },
  on_attach = function(client, bufnr)
    local handlers = require "user.lsp.handlers"
    handlers.lsp_format(client, bufnr)
    handlers.lsp_keymaps(bufnr)
  end,
}
