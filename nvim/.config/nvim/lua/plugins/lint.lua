---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      django = { "djlint" },
      dockerfile = { "hadolint" },
      gitcommit = { "commitlint" },
      htmldjango = { "djlint" },
      ["jinja.html"] = { "djlint" },
      markdown = { "markdownlint-cli2" },
      python = { "flake8", "mypy", "pylint" },
      tf = { "tfsec" },
      terraform = { "tfsec" },
      ["terraform-vars"] = { "tfsec" },
      yaml = { "yamllint" },
    },
  },
}
