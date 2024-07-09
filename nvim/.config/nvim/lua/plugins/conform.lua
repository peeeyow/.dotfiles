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
    format_on_save = { timeout_ms = 1000 },
    formatters_by_ft = {
      bib = { "bibtex-tidy" },
      django = { "djlint" },
      htmldjango = { "djlint" },
      ["jinja.html"] = { "djlint" },
      lua = { "stylua" },
      python = { "isort", "black" },
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
