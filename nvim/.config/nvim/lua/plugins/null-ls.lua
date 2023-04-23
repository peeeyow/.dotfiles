return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      local null_ls = require "null-ls"
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local codeactions = null_ls.builtins.code_actions
      local default_diagnostic_format = "#{m}\n(#{c})"
      return {
        debug = false,
        sources = {
          formatting.black,
          formatting.djlint.with {
            extra_args = { "--indent", "2" },
          },
          formatting.isort,
          formatting.prettierd,
          formatting.stylua,
          diagnostics.djlint,
          diagnostics.flake8.with {
            diagnostics_format = default_diagnostic_format,
          },
          diagnostics.mypy.with {
            diagnostics_format = default_diagnostic_format,
          },
          diagnostics.yamllint,
          codeactions.gitsigns,
        },
        on_attach = function(client, bufnr)
          local handlers = require "plugins.lsp.handlers"
          handlers.lsp_format(client, bufnr)
          handlers.lsp_keymaps(bufnr)
        end,
      }
    end,
  },
}
