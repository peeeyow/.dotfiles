return {
  {
    "windwp/nvim-autopairs",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = false,
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    },
    config = function(_, opts)
      local autopairs = require "nvim-autopairs"
      autopairs.setup(opts)
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"

      autopairs.add_rule(Rule("$$", "$$", "tex"))
      autopairs.add_rules {
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")
          :with_pair(cond.not_before_regex(3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex "xx")
          :with_cr(cond.none()),
      }
      autopairs.add_rules {
        Rule("$$", "$$", "tex"):with_pair(function(options)
          if options.line == "aa $$" then
            return false
          end
        end),
      }

      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local handlers = require "nvim-autopairs.completion.handlers"

      local cmp = require "cmp"

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
    end,
  },
}
