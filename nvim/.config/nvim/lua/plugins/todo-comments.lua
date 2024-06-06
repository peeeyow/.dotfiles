---@type LazySpec
return {
  "folke/todo-comments.nvim",
  opts = {},
  event = "User AstroFile",
  keys = {
    { "<Leader>t", desc = "Todo Comments" },
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
    { "<Leader>tr", "<Cmd>TroubleToggle<CR>", desc = "Toggle Trouble" },
    { "<Leader>tw", "<Cmd>Trouble workspace_diagnostics<CR>", desc = "Open Trouble Workspace Diagnostics" },
    { "<Leader>td", "<Cmd>Trouble document_diagnostics<CR>", desc = "Open Trouble Document Diagnostics" },
    { "<Leader>tt", "<Cmd>Trouble todo<CR>", desc = "Open todo Trouble" },
  },
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
}
