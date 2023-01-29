-- local format = require("user.lsp.handlers").format

-- local n_leader = {
--   opts = {
--     mode = "n",
--     prefix = "<leader>",
--     buffer = nil,
--     silent = true,
--     noremap = true,
--     nowait = true,
--   },
--   mappings = {
--     ["e"] = { [[<CMD>:NvimTreeToggle<CR>]], "File Explorer" },
--     -- https://github.com/folke/which-key.nvim/issues/173
--     ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
--     ["p"] = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
-- ["L"] = { "<cmd>Lazy<cr>" , "Lazy"}
--     ["t"] = {
--       name = "Trouble",
--       ["r"] = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
--       ["w"] = { "<cmd>Trouble workspace_diagnostics<cr>", "Open Trouble Workspace Diagnostics" },
--       ["d"] = { "<cmd>Trouble document_diagnostics<cr>", "Open Trouble Document Diagnostics" },
--       ["t"] = { "<cmd>Trouble todo<cr>", "Open todo Trouble" },
--     },
--   },
-- }

return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      key_labels = {
        ["<space>"] = "SPC",
        ["<leader>"] = "SPC",
        ["<cr>"] = "↩",
        ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      popup_mappings = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },
      window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      ignore_missing = false,
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
      show_help = true,
      triggers = "auto",
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register({
        ["<leader>"] = { "Leader options" },
        ["<leader>b"] = { name = "Buffer" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>l"] = { name = "LSP" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>x"] = { name = "Swap" },
      }, {
        mode = "n",
        prefix = nil,
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      })
    end,
  },
}
