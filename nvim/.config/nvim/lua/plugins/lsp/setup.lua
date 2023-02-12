local status_ok_lspc, lsp_config = pcall(require, "lspconfig")
if not status_ok_lspc then
  return
end
local status_ok_tsserver, tsserver = pcall(require, "typescript")
if not status_ok_tsserver then
  return
end

local opts = {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = require("plugins.lsp.handlers").capabilities,
}
local jsonls_opts = require "plugins.lsp.settings.jsonls"
jsonls_opts = vim.tbl_deep_extend("keep", jsonls_opts, opts)

local yaml_opts = require("yaml-companion").setup {}
yaml_opts = vim.tbl_deep_extend("keep", yaml_opts, opts)

local lua_ls_opts = require "plugins.lsp.settings.sumneko_lua"
lua_ls_opts = vim.tbl_deep_extend("keep", lua_ls_opts, opts)
local luadev_status_okay, luadev = pcall(require, "neodev")
if not luadev_status_okay then
  return
end
luadev.setup {}

local pyright_opts = require "plugins.lsp.settings.pyright"
pyright_opts = vim.tbl_deep_extend("keep", pyright_opts, opts)

local clangd_opts = require "plugins.lsp.settings.clangd"
clangd_opts = vim.tbl_deep_extend("keep", clangd_opts, opts)
clangd_opts.capabilities.offsetEncoding = { "utf-16" }

local servers = {
  jsonls = jsonls_opts,
  lua_ls = lua_ls_opts,
  pyright = pyright_opts,
  clangd = clangd_opts,
  bashls = opts,
  cssls = opts,
  html = opts,
  emmet_ls = opts,
  tailwindcss = opts,
  graphql = opts,
  prismals = opts,
  dockerls = opts,
  yamlls = yaml_opts,
}

tsserver.setup {
  server = opts,
}

for lsp, lsp_opts in pairs(servers) do
  lsp_config[lsp].setup(lsp_opts)
end
