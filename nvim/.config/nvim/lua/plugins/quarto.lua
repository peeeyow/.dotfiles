---@type LazySpec
return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto" },
    dependencies = {
      "jmbuhr/otter.nvim",
    },
    opts = {
      debug = true,
    },
  },
}
