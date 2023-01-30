return {
  {
    "folke/noice.nvim",
    lazy = false,
    keys = {

      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll forward",
        mode = { "i", "n", "s" },
      },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll backward",
        mode = { "i", "n", "s" },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      debug = false,
      lsp = {
        progress = { enabled = true },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
        {
          filter = { find = "No information available" },
          opts = { skip = true },
        },
        {
          filter = { find = "formatting" },
          opts = { skip = true },
        },
        {
          filter = { find = "diagnostics" },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
          view = "mini",
        },
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        cmdline_output_to_split = false,
      },
      commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      },
      views = {
        hover = {
          size = {
            max_width = 60,
          },
        },
      },
      format = {
        level = {
          icons = false,
        },
      },
    },
  },
}
