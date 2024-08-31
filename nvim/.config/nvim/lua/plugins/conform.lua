--- Sets Local python module path or command
---@param name string
local get_python_path_or_command = function(name)
  return require("conform.util").find_executable({
    "./.venv/bin/" .. name,
  }, name)
end

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
      markdown = { "injected", "prettierd" },
      python = { "isort", "black" },
      quarto = { "injected" },
      tex = { "latexindent" },
    },
    formatters = {
      black = {
        command = get_python_path_or_command "black",
      },
      isort = {
        command = get_python_path_or_command "isort",
      },
    },
  },
}
