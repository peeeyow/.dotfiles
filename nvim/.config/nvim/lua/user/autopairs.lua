local status_ok, autopairs = pcall(require, "nvim-autopairs")
local Rule = require "nvim-autopairs.rule"
local cond = require "nvim-autopairs.conds"

if not status_ok then
  return
end

autopairs.setup {
  enable_check_bracket_line = false,
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
}

autopairs.add_rule(Rule("$$", "$$", "tex"))
autopairs.add_rules {
  Rule("$", "$", { "tex", "latex" })
    :with_pair(cond.not_after_regex_check "%%")
    :with_pair(cond.not_before_regex_check("xxx", 3))
    :with_move(cond.none())
    :with_del(cond.not_after_regex_check "xx")
    :with_cr(cond.none()),
}
autopairs.add_rules {
  Rule("$$", "$$", "tex"):with_pair(function(opts)
    print(vim.inspect(opts))
    if opts.line == "aa $$" then
      -- don't add pair on that line
      return false
    end
  end),
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local handlers = require "nvim-autopairs.completion.handlers"

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done {
    filetypes = {
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"],
        },
      },
      tex = {
        ["{"] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"],
        },
      },
      prisma = false,
    },
  }
)
