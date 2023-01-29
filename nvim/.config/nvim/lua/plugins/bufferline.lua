return {
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<leader><lt>", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer to Left" },
      { "<leader>>", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer to Right" },

      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
      { "<leader>bt", "<cmd>BufferLineSortByTabs<cr>", desc = "Sort buffers by Tab" },
      { "<leader>bd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort buffers by Directory" },
      { "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort buffers by Extension" },
      {
        "<leader>bb",
        function()
          require("telescope.builtin").buffers(require("telescope.themes").get_dropdown { previewer = false })
        end,
        desc = "Choose from buffers",
      },
    },
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
