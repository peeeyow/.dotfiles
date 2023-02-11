return {
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>ss",
        function()
          require("ssr").open()
        end,
        desc = "Start SSR",
        mode = { "n", "x" },
      },
    },
    config = true,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
