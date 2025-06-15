---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- LSPs
        "basedpyright",
        "bash-language-server",
        "clangd",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "r-languageserver",
        "ruff",
        "rust-analyzer",
        "tailwindcss-language-server",
        "taplo",
        "terraform-ls",
        "texlab",
        "tflint",
        "yaml-language-server",

        -- Linters and formatters
        "bibtex-tidy",
        "commitlint",
        "djlint",
        "flake8",
        "hadolint",
        "latexindent",
        "markdownlint-cli2",
        "prettier",
        "tfsec",
        "typstyle",
        "yamllint",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
