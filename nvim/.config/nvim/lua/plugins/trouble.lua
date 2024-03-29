return {
  {
    "folke/trouble.nvim",
    keys = {
      {
        "[t",
        function()
          require("trouble").previous { skip_groups = true, jump = true }
        end,
        desc = "Prev Trouble Item",
      },
      {
        "]t",
        function()
          require("trouble").next { skip_groups = true, jump = true }
        end,
        desc = "Next Trouble Item",
      },
      { "<leader>tr", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
      { "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Open Trouble Workspace Diagnostics" },
      { "<leader>td", "<cmd>Trouble document_diagnostics<cr>", desc = "Open Trouble Document Diagnostics" },
      { "<leader>tt", "<cmd>Trouble todo<cr>", desc = "Open todo Trouble" },
    },
    opts = {
      position = "bottom",
      height = 10,
      width = 50,
      icons = true,
      mode = "workspace_diagnostics",
      fold_open = "",
      fold_closed = "",
      group = true,
      padding = true,
      action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = { "<cr>", "<tab>" },
        open_split = { "<c-x>" },
        open_vsplit = { "<c-v>" },
        open_tab = { "<c-t>" },
        jump_close = { "o" },
        toggle_mode = "m",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        close_folds = { "zM", "zm" },
        open_folds = { "zR", "zr" },
        toggle_fold = { "zA", "za" },
        previous = "k",
        next = "j",
      },
      indent_lines = true,
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_fold = false,
      auto_jump = { "lsp_definitions" },
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠",
      },
      use_diagnostic_signs = false,
    },
  },
}
