---@type LazySpec
return {
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    ft = { "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "htmldjango" },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    keys = {
      { "<Leader>uC", "<Cmd>CccHighlighterToggle<CR>", desc = "Toggle colorizer" },
      { "<Leader>zc", "<Cmd>CccConvert<CR>", desc = "Convert color" },
      { "<Leader>zp", "<Cmd>CccPick<CR>", desc = "Pick Color" },
    },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
    config = function(_, opts)
      require("ccc").setup(opts)
      if opts.highlighter and opts.highlighter.auto_enable then vim.cmd.CccHighlighterEnable() end
    end,
  },
}
