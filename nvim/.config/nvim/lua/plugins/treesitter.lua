---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = {
      treesitter = {
        highlight = {
          additional_vim_regex_highlighting = { "markdown" },
          disable = { "latex" },
        },
        indent = true,
        auto_install = true,
        ensure_installed = "all",
        ignore_install = { "wing", "ipkg", "latex", "scfg", "teal", "swift", "ocamllex", "unison", "mlir" },
        matchup = {
          enable = true,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        mode = "topline",
      })
    end,
  },
}
