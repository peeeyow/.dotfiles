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
    config = function(_, opts)
      local onedark = require "onedark"
      onedark.setup(opts)
      require("onedark").load()
    end,
  },
}
