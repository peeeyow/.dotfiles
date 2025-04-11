local in_math = require("snippets.utils").in_math
local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local pf = require("luasnip.extras.postfix").postfix

return {
  s({ trig = "inft", condition = in_math, snippetType = "autosnippet" }, t "infinity"),
}
