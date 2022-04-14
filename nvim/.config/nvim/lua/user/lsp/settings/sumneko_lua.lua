return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        }
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "tab",
          indent_size = "2",
          tab_width = "2",
          call_arg_parentheses = "remove",
          quote_style = "double",
          insert_final_newline = true,
        },
      }
    },
  },
}
