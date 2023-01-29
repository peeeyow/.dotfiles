vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree", "null-ls-info" }

return {
  {
    "RRethy/vim-illuminate",
    keys = {
      {
        "<m-n>",
        function()
          require("illuminate").goto_next_reference()
        end,
        noremap = true,
        silent = true,
        desc = "Jump to next reference",
      },
      {
        "<m-p>",
        function()
          require("illuminate").goto_prev_reference()
        end,
        noremap = true,
        silent = true,
        desc = "Jump to previous reference",
      },
    },
  },
}
