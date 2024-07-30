---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "jmbuhr/otter.nvim",
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    local snip_status_ok, luasnip = pcall(require, "luasnip")

    if not snip_status_ok then return end

    opts.experimental = {
      ghost_text = false,
    }
    local mapping = {
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ["<C-y>"] = cmp.mapping.confirm { select = false },
      ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-l>"] = cmp.mapping(function()
        if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
      end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function()
        if luasnip.jumpable(-1) then luasnip.jump(-1) end
      end, { "i", "s" }),
      ["<C-f>"] = cmp.mapping(
        function(fallback) return luasnip.choice_active() and luasnip.change_choice(1) or fallback() end,
        { "i", "s" }
      ),
      ["<C-b>"] = cmp.mapping(
        function(fallback) return luasnip.choice_active() and luasnip.change_choice(-1) or fallback() end,
        { "i", "s" }
      ),
    }
    opts.mapping = mapping
    return opts
  end,
  config = function(_, opts)
    local cmp = require "cmp"
    cmp.setup(opts)

    cmp.setup.filetype("quarto", {
      sources = cmp.config.sources {
        { name = "otter", priority = 1500 },
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
    })
  end,
}
