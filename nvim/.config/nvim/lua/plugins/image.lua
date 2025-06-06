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
      typst = {
        enabled = false,
      },
    },
    max_width = 100,
    max_height = 12,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    tmux_show_only_in_active_window = true,
  },
}
