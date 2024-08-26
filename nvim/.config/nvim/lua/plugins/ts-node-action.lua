---@type LazySpec
return {
  "CKolkey/ts-node-action",
  keys = {
    {
      "<Leader>Ma",
      function(...) require("ts-node-action").node_action(...) end,
      desc = "Trigger TS Node Action",
    },
  },
  dependencies = { "nvim-treesitter" },
  opts = {},
}
