---@type LazySpec
return {
  "Wansmer/treesj",
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  keys = {
    { "<Leader>mt", "<Cmd>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
  },

  opts = { use_default_keymaps = false },
}
