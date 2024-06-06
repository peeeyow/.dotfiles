---@type LazySpec
return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  keys = {
    { "<Leader>P", "<Cmd>PasteImage<CR>", desc = "Paste clipboard image" },
  },
  opts = {
    default = {
      drag_and_drop = {
        copy_images = true,
      },
    },
    filetypes = {
      tex = {
        dir_path = "assets/images",
      },
    },
  },
}
