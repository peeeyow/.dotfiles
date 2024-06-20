---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"
    local codeactions = null_ls.builtins.code_actions

    config.sources = {
      codeactions.gitsigns,
    }
    return config
  end,
}
