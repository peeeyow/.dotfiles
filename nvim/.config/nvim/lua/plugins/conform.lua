---@type LazySpec
return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = function(bufnr)
      if vim.g.autoformat == nil then vim.g.autoformat = true end
      local autoformat = vim.b[bufnr].autoformat
      if autoformat == nil then autoformat = vim.g.autoformat end
      if autoformat then return { timeout_ms = 1000, lsp_format = "fallback" } end
    end,
    formatters_by_ft = {
      bib = { "bibtex-tidy" },
      django = { "djlint" },
      htmldjango = { "djlint" },
      ["jinja.html"] = { "djlint" },
      lua = { "stylua" },
      markdown = { "prettier", "injected" },
      python = {
        -- "ruff_fix", --too aggresive
        "ruff_format",
        "ruff_organize_imports",
      },
      quarto = { "prettier", "injected" },
      r = { "styler", lsp_format = "fallback" },
      tex = { "latexindent" },
      typst = { "typstyle" },
    },
    formatters = {
      styler = {
        command = "/usr/local/bin/R",
        args = { "-s", "-e", "styler::style_file(commandArgs(TRUE))", "--args", "$FILENAME" },
        stdin = false,
      },
      prettier = {
        options = {
          ext_parsers = {
            qmd = "markdown",
            -- CHANGELOG
            [""] = "markdown",
          },
        },
      },
    },
  },
}
