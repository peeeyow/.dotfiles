local in_math = require("snippets.utils").in_math
local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local pf = require("luasnip.extras.postfix").postfix

return {
  -- scripts
  s({ trig = "_", condition = in_math, wordTrig = false, snippetType = "autosnippet" }, fmt("_({})", i(1))),
  s({ trig = "td", condition = in_math, wordTrig = false, snippetType = "autosnippet" }, fmt("^({})", i(1))),
  -- roots and exponents
  s({ trig = "sr", condition = in_math, wordTrig = false, snippetType = "autosnippet" }, t "^(2)"),
  s({ trig = "cb", condition = in_math, wordTrig = false, snippetType = "autosnippet" }, t "^(3)"),
  pf(
    { trig = "sq", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "sqrt(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
  -- over/underlines
  pf(
    { trig = "bar", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "overline(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
  pf(
    { trig = "und", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "underline(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
  -- other accents
  pf(
    { trig = "hat", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "hat(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
  pf(
    { trig = "gr", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "grave(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
  pf(
    { trig = "ac", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "acute(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
  pf(
    { trig = "~", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "tilde(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
  pf(
    { trig = "cc", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "cancel(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
  -- font weight
  pf(
    { trig = "bold", condition = in_math, snippetType = "autosnippet" },
    f(function(_, parent) return "bold(" .. parent.snippet.env.POSTFIX_MATCH .. ")" end)
  ),
}
