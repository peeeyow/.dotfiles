local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

lsp_signature.setup {
  debug = false,
  verbose = true,
  bind = true,
  doc_lines = 10,

  floating_window = true,

  floating_window_above_cur_line = true,

  max_height = 12,
  hint_enable = true,
  hint_prefix = "",
  max_width = 50,
  handler_opts = {
    border = "rounded",
  },
}
