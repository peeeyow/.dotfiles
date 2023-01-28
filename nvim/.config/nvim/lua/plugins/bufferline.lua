-- bufferline.setup {
--   options = {
--     numbers = "none",
--     close_command = "bp<bar>sp<bar>bn<bar>bd",
--     max_name_length = 18,
--     max_prefix_length = 15,
--     tab_size = 20,
--     diagnostics = "nvim_lsp",
--     diagnostics_update_in_insert = true,
--     diagnostics_indicator = function(_, _, diagnostics_dict, _)
--       local s = " "
--       for e, n in pairs(diagnostics_dict) do
--         local sym = e == "error" and " " or (e == "warning" and " " or " ")
--         s = s .. n .. sym
--       end
--       return s
--     end,
--     offsets = {
--       {
--         filetype = "NvimTree",
--         text = "File Explorer",
--         text_align = "left",
--         padding = 1,
--       },
--     },
--     show_buffer_close_icons = false,
--     show_close_icon = false,
--     separator_style = "slant",
--   },
-- }

return {
  "akinsho/bufferline.nvim",
  {

    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        numbers = "none",
        close_command = "bp<bar>sp<bar>bn<bar>bd",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 20,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(_, _, diagnostics_dict, _)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            padding = 1,
          },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant",
      },
    },
  },
}
