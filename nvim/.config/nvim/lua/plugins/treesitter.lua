---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
    "andymass/vim-matchup",
  },
  opts = function(_, opts)
    return require("astrocore").extend_tbl(opts, {
      ensure_installed = "all",
      ignore_install = { "wing" },
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
