---@type LazySpec
return {
  "numToStr/Comment.nvim",
  keys = {
    {
      "<C-_>",
      function() require("Comment.api").toggle.linewise.current() end,
      desc = "Line comment",
    },
    {
      "<C-/>",
      function() require("Comment.api").toggle.linewise.current() end,
      desc = "Line comment",
    },
    {
      [[<C-\>]],
      function() require("Comment.api").toggle.blockwise.current() end,
      desc = "Block comment",
    },
    {
      "<C-_>",
      function()
        local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.linewise(vim.fn.visualmode())
      end,
      mode = { "x" },
      desc = "Visual Line comment",
    },
    {
      "<C-/>",
      function()
        local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.linewise(vim.fn.visualmode())
      end,
      mode = { "x" },
      desc = "Visual Line comment",
    },
    {
      [[<C-\>]],
      function()
        local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.blockwise(vim.fn.visualmode())
      end,
      mode = { "x" },
      desc = "Visual Block comment",
    },
  },
}
