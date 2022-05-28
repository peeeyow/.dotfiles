local status_ok_lspc, lsp_config = pcall(require, "lspconfig")
if not status_ok_lspc then
  return
end
local status_ok_tsserver, tsserver = pcall(require, "typescript")
if not status_ok_tsserver then
  return
end

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}
local jsonls_opts = require "user.lsp.settings.jsonls"
jsonls_opts = vim.tbl_deep_extend("keep", jsonls_opts, opts)

local sumneko_opts = require "user.lsp.settings.sumneko_lua"
sumneko_opts = vim.tbl_deep_extend("keep", sumneko_opts, opts)
local luadev_status_okay, luadev = pcall(require, "lua-dev")
if not luadev_status_okay then
  return
end
sumneko_opts = luadev.setup {
  lspconfig = sumneko_opts,
}

local pyright_opts = require "user.lsp.settings.pyright"
pyright_opts = vim.tbl_deep_extend("keep", pyright_opts, opts)

local clangd_opts = require "user.lsp.settings.clangd"
clangd_opts = vim.tbl_deep_extend("keep", clangd_opts, opts)
clangd_opts.capabilities.offsetEncoding = { "utf-16" }

local servers = {
  jsonls = jsonls_opts,
  sumneko_lua = sumneko_opts,
  pyright = pyright_opts,
  clangd = clangd_opts,
  bashls = opts,
  cssls = opts,
  html = opts,
  emmet_ls = opts,
  tailwindcss = opts,
}

tsserver.setup {
  server = opts,
}

for lsp, lsp_opts in pairs(servers) do
  lsp_config[lsp].setup(lsp_opts)
end
