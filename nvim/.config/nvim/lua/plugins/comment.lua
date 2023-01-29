return {
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "<C-_>",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Line comment",
      },
      {
        "<C-/>",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Line comment",
      },
      {
        [[<C-\>]],
        function()
          require("Comment.api").toggle.blockwise.current()
        end,
        desc = "Block comment",
      },
      {
        "<C-_>",
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "nx", false)
          require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        mode = { "x" },
        desc = "Visual Line comment",
      },
      {
        "<C-/>",
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "nx", false)
          require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        mode = { "x" },
        desc = "Visual Line comment",
      },
      {
        [[<C-\>]],
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "nx", false)
          require("Comment.api").toggle.blockwise(vim.fn.visualmode())
        end,
        mode = { "x" },
        desc = "Visual Block comment",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      pre_hook = function(ctx)
        local U = require "Comment.utils"

        local location = nil
        if ctx.ctype == U.ctype.blockwise then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
          key = ctx.ctype == U.ctype.linewise and "__default" or "__multiline",
          location = location,
        }
      end,
      padding = true,
      ignore = "^$",
      mappings = {
        basic = true,
        extra = false,
      },
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      post_hook = nil,
    },
  },
}
