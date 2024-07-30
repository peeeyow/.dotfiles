---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<Leader>fz", "<Cmd>Telescope zotero<CR>", desc = "Find zotero references" },
    },
    dependencies = {
      {
        "jmbuhr/telescope-zotero.nvim",
        dependencies = {
          { "kkharji/sqlite.lua" },
        },
      },
    },
    opts = function(_, opts)
      local open_with_trouble = function(...) return require("trouble.sources.telescope").open(...) end
      local telescope = require "telescope"
      telescope.load_extension "zotero"
      return require("astrocore").extend_tbl(opts, {
        defaults = {
          mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = { ["<c-t>"] = open_with_trouble },
          },
        },
      })
    end,
  },
}
