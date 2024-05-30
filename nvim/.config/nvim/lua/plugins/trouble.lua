local prefix = "<leader>x"

---@type LazySpec
return {
  "folke/trouble.nvim",
  keys = {
    {
      "[x",
      function() require("trouble").previous { skip_groups = true, jump = true } end,
      desc = "Prev Trouble Item",
    },
    {
      "]x",
      function() require("trouble").next { skip_groups = true, jump = true } end,
      desc = "Next Trouble Item",
    },
    { prefix .. "z", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
    { prefix .. "t", "<cmd>TroubleToggle todo<cr>", desc = "Todo (Trouble)" },
    { prefix .. "r", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References (Trouble)" },
  },
}
