---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    local codeactions = null_ls.builtins.code_actions

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      codeactions.gitsigns,
    })
  end,
}
