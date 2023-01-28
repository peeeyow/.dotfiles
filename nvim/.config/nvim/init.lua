-- require "user.options"
-- require "user.keymaps"
-- require "user.plugins"
-- require "user.colorscheme"
-- require "user.lsp"
-- require "user.autocmds"

require "config.options"
require "config.lazy"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "config.autocmds"
    require "config.keymaps"
  end,
})
