local prefix = "<Leader>x"

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
    { prefix .. "z", "<Cmd>TroubleToggle<CR>", desc = "Trouble toggle" },
    { prefix .. "t", "<Cmd>TroubleToggle todo<CR>", desc = "Todo (Trouble)" },
    { prefix .. "r", "<Cmd>TroubleToggle lsp_references<CR>", desc = "LSP References (Trouble)" },
  },
}
