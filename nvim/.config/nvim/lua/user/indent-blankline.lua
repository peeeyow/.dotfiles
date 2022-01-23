local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

-- vim.cmd [[
--   highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine
--   highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine
--   highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine
--   highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine
--   highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine
--   highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine
-- ]]

indent_blankline.setup {
  char = "▎",
  show_current_context = true,
  use_treesitter = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
  filetype_exclude = {
    "lspinfo",
    "packer",
    "checkhealth",
    "help",
    "NvimTree",
    "TelescopePrompt",
    "TelescopeResults",
    "Trouble",
    "startify",
    "neogitstatus",
    "",
  },
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  },
}
