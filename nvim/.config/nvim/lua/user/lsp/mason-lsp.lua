local status_ok, mason_lsp = pcall(require, "mason-lspconfig")

if not status_ok then
  return
end

mason_lsp.setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    "emmet_ls",
    "graphql",
    "html",
    "jsonls",
    "prismals",
    "pyright",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
  },
}
