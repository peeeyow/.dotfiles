---@type LazySpec
return {
  "mosheavni/yaml-companion.nvim",
  ft = { "yaml" },
  config = function(_, opts)
    local cfg = require("yaml-companion").setup(opts)
    vim.lsp.config("yamlls", cfg)
    vim.lsp.enable "yamlls"
  end,
}
