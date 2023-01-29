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
        ["<leader>t"] = { name = "Trouble" },
        ["<leader>x"] = { name = "Swap" },
        ["<leader>L"] = { "<cmd>Lazy<cr>", "Lazy" },
        ["<leader>m"] = { "<cmd>Mason<cr>", "Mason" },
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
