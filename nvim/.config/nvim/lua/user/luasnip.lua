local ls_status_ok, ls = pcall(require, "luasnip")
if not ls_status_ok then
  return
end

ls.setup {
  history = false,
}
ls.filetype_extend("htmldjango", { "djangohtml" })

local ls_vs_status_ok, ls_vs = pcall(require, "luasnip/loaders/from_vscode")
if not ls_vs_status_ok then
  return
end

ls_vs.lazy_load()
