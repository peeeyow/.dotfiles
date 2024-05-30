---@type LazySpec
return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  keys = {
    { "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
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
