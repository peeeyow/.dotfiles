local in_math = require("snippets.utils").in_math
local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
  s(
    {
      trig = "dm",
      dscr = "Insert display math",
      condition = function() return not in_math() end,
      snippetType = "autosnippet",
    },
    fmt(
      [[
        $
          {}
        $
        {}
      ]],
      { i(1), i(0) }
    )
  ),
  s({
    trig = "mk",
    dscr = "Insert inline math",
    condition = function() return not in_math() end,
    snippetType = "autosnippet",
  }, fmt("${}${}", { i(1), i(0) })),
}
