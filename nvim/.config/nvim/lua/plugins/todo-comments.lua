---@type LazySpec
return {
  "folke/todo-comments.nvim",
  opts = {},
  event = "User AstroFile",
  keys = {
    { "<leader>t", desc = "Todo Comments" },
    {
      "[t",
      function() require("trouble").previous { skip_groups = true, jump = true } end,
      desc = "Prev Trouble Item",
    },
    {
      "]t",
      function() require("trouble").next { skip_groups = true, jump = true } end,
      desc = "Next Trouble Item",
    },
    { "<leader>tr", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
    { "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Open Trouble Workspace Diagnostics" },
    { "<leader>td", "<cmd>Trouble document_diagnostics<cr>", desc = "Open Trouble Document Diagnostics" },
    { "<leader>tt", "<cmd>Trouble todo<cr>", desc = "Open todo Trouble" },
  },
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
}
