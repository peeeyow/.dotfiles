vim.cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

return {
  {
    "kyazdani42/nvim-tree.lua",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
    },
    opts = {
      auto_reload_on_write = true,
      disable_netrw = true,
      hijack_netrw = true,
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 200,
      },
      view = {
        hide_root_folder = false,
        side = "left",
        mappings = {
          custom_only = false,
          list = {
            { key = { "l", "<CR>", "o" }, action = "edit" },
            { key = "h", action = "close_node" },
            { key = "v", action = "vsplit" },
          },
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },
      filters = {
        dotfiles = false,
        custom = { "node_modules", ".cache" },
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      renderer = {
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              deleted = "",
              untracked = "U",
              ignored = "◌",
            },
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
          },
        },
      },
    },
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require "nvim-tree"
        end
      end
    end,
  },
}
