---@type LazySpec
return {
  "windwp/nvim-autopairs",
  config = function(plugin, opts)
    require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)
    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"
    local cond = require "nvim-autopairs.conds"
    npairs.add_rules({
      Rule("$", "$", { "tex", "latex" })
        :with_pair(cond.not_after_regex "%%")
        :with_pair(cond.not_before_regex("xxx", 3))
        :with_move(cond.none())
        :with_del(cond.not_after_regex "xx")
        :with_cr(cond.none()),
    }, Rule("a", "a", "-vim"))
  end,
}
