---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
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
        "pyright",
        "tailwindcss",
        "taplo",
        "terraformls",
        "tflint",
        "tsserver",
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
        "flake8",
        "isort",
        "latexindent",
        "prettierd",
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
