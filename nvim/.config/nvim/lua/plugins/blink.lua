return {
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = {},
      ["<S-Tab>"] = {},
      ["<C-l>"] = { "snippet_forward" },
      ["<C-h>"] = { "snippet_backward" },
    },
    completion = {
      list = { selection = { preselect = false, auto_insert = false } },
    },
  },
}
