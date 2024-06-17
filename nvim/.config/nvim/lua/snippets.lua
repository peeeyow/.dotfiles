local ls_ok, ls = pcall(require, "luasnip")

if not ls_ok then
  vim.notify("Not able to setup snippets", 3)
  return
end

local s = ls.snippet
local t = ls.text_node

-- R: qq to <-
ls.add_snippets("r", { s("qq", { t "<- " }) }, { type = "autosnippets", key = "auto_all" })
