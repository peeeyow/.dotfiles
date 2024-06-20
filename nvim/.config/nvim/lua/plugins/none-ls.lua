---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"
    -- local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local codeactions = null_ls.builtins.code_actions
    local default_diagnostic_format = "#{m}\n(#{c})"

    config.sources = {
      -- formatting.black.with {
      --   prefer_local = true,
      -- },
      -- formatting.djlint.with {
      --   extra_args = { "--indent", "2" },
      --   prefer_local = true,
      -- },
      -- formatting.isort.with {
      --   prefer_local = true,
      -- },
      -- formatting.prettierd,
      -- formatting.stylua,
      -- diagnostics.djlint.with {
      --   prefer_local = true,
      -- },
      --[[ diagnostics.flake8.with {
        diagnostics_format = default_diagnostic_format,
      }, ]]
      diagnostics.hadolint.with {
        diagnostics_format = default_diagnostic_format,
      },
      diagnostics.mypy.with {
        diagnostics_format = default_diagnostic_format,
        prefer_local = true,
      },
      diagnostics.yamllint,
      diagnostics.commitlint,
      diagnostics.tfsec,
      codeactions.gitsigns,
    }
    return config
  end,
}
