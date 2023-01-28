return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
    },
    opts = {
      history = false,
    },
    config = function(_, opts)
      local luasnip = require "luasnip"
      luasnip.setup(opts)
      luasnip.filetype_extend("htmldjango", { "djangohtml" })
    end,
  },
}
