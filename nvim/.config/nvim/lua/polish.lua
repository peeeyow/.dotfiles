local create_autocmd = vim.api.nvim_create_autocmd
local create_autogroup = vim.api.nvim_create_augroup

create_autocmd("BufEnter", {
  group = create_autogroup("no_comment_on_enter", { clear = true }),
  desc = "No longer comments upon newline",
  callback = function() vim.opt_local.formatoptions:remove { "c", "r", "o" } end,
})

create_autocmd("FocusGained", {
  group = create_autogroup("auto_file_reload", { clear = true }),
  desc = "Reloads file when change is detected",
  command = "checktime",
})

-- don't auto remove highlight on key press other than hlsearch navigation
vim.on_key(function() end, vim.api.nvim_get_namespaces()["auto_hlsearch"])
