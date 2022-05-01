local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

au("TextYankPost", {
  group = aug("highlight_yank", { clear = true }),
  desc = "Highlight text on yank.",
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end
})

au("BufEnter", {
  group = aug("no_comment_on_enter", { clear = true }),
  desc = "No longer comments upon newline",
  callback = function()
    vim.opt_local.formatoptions:remove { "c", "r", "o" }
  end
})
