return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "darker",
      transparent = false,
      highlights = {
        rainbowcol1 = { fg = "#abb2bf" },
      },
    },
    config = function()
      vim.cmd [[colorscheme onedark]]
    end,
  },
}
