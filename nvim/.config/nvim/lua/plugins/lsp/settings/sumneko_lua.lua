return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      format = {
        enable = false,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          call_arg_parentheses = "remove_table_only",
          quote_style = "double",
        },
      },
    },
  },
}
