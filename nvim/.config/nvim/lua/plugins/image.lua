---@type LazySpec
return {
  "3rd/image.nvim",
  event = "VeryLazy",
  dependencies = {
    "https://github.com/leafo/magick",
  },
  opts = {
    integrations = {
      markdown = {
        filetypes = { "markdown", "quarto" },
      },
    },
  },
}
