---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type
  opts = function(_, opts)
    return require("astrocore").extend_tbl(opts, {
      ensure_installed = "all",
      ignore_install = { "wing", "ipkg", "latex", "scfg", "teal", "swift", "ocamllex", "unison", "mlir" },
      matchup = {
        enable = true,
      },
      highlight = {
        additional_vim_regex_highlighting = { "markdown" },
        disable = { "latex" },
      },
    })
  end,
}
