local status_ok, mason_lsp = pcall(require, "mason-lspconfig")

if not status_ok then
  return
end

mason_lsp.setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "emmet_ls",
    "graphql",
    "html",
    "jsonls",
    "pyright",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
  },
}
