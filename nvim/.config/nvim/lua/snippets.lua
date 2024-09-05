local ls_ok, ls = pcall(require, "luasnip")

if not ls_ok then
  vim.notify("Not able to setup snippets", 3)
  return
end

local s = ls.snippet
local t = ls.text_node

-- R: qq to <-
ls.add_snippets("r", { s("qq", { t "<- " }) }, { type = "autosnippets", key = "auto_arrow_r" })
ls.add_snippets("markdown", { s("qq", { t "<- " }) }, { type = "autosnippets", key = "auto_arrow_markdown" })
ls.add_snippets("qmd", { s("qq", { t "<- " }) }, { type = "autosnippets", key = "auto_arrow_qmd" })
ls.add_snippets("quarto", { s("qq", { t "<- " }) }, { type = "autosnippets", key = "auto_arrow_quarto" })
