return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "darker",
      transparent = false,
    },
    config = function(_, opts)
      local onedark = require "onedark"
      onedark.setup(opts)
      onedark.load()
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      dim_inactive = true,
    },
    config = function(_, opts)
      local tokyonight = require "tokyonight"
      tokyonight.setup(opts)
      -- tokyonight.load()
    end,
  },
}
