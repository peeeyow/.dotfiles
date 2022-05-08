vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree", "null-ls-info" }
vim.keymap.set("n", "<a-n>", function()
  require("illuminate").next_reference { wrap = true }
end, { noremap = true })
vim.keymap.set("n", "<a-p>", function()
  require("illuminate").next_reference { reverse = true, wrap = true }
end, { noremap = true })
