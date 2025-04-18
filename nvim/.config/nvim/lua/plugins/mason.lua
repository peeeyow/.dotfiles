---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "basedpyright",
        "bashls",
        "clangd",
        "cssls",
        "dockerls",
        "emmet_ls",
        "eslint",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "prismals",
        "r_language_server",
        "rust_analyzer",
        "tailwindcss",
        "taplo",
        "terraformls",
        "texlab",
        "tflint",
        "ts_ls",
        "yamlls",
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "bibtex-tidy",
        "black",
        "commitlint",
        "djlint",
        "flake8",
        "hadolint",
        "isort",
        "latexindent",
        "markdownlint-cli2",
        "prettier",
        "tfsec",
        "typstyle",
        "yamllint",
      })
      opts.automatic_installation = { exclude = { "mypy" } }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
      })
      if not opts.handlers then opts.handlers = {} end
      opts.handlers.python = function() end
    end,
  },
}
