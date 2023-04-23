return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "cssls",
        "eslint",
        "dockerls",
        "emmet_ls",
        "graphql",
        "html",
        "jsonls",
        "prismals",
        "pyright",
        "lua_ls",
        "tailwindcss",
        "tsserver",
        "yamlls",
      },
      automatic_installation = true,
    },
  },
}
