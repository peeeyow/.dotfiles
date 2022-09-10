local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local lsp_handlers = require "user.lsp.handlers"

local augroup = vim.api.nvim_create_augroup("NullLspFormatting", {})
local function lsp_format(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end
end

local on_attach = function(client, bufnr)
  lsp_handlers.lsp_keymaps(bufnr)
  lsp_format(client, bufnr)
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions
local default_diagnostic_format = "#{m}\n(#{c})"

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettierd,
    formatting.black,
    formatting.stylua,
    diagnostics.flake8.with {
      diagnostics_format = default_diagnostic_format,
    },
    diagnostics.eslint_d.with {
      diagnostics_format = default_diagnostic_format,
    },
    codeactions.gitsigns,
    codeactions.eslint_d,
  },
  on_attach = on_attach,
}
