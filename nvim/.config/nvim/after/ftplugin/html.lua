local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

cmp.setup.buffer {
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 4 },
    { name = "path" },
  },
}
