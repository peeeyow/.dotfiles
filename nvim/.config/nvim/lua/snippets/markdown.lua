local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("r", { s("qq", { t "<- " }) }, { type = "autosnippets", key = "auto_arrow_r" })
return {
  s({ trig = "qq", snippetType = "autosnippet" }, { t "<- " }),
}
