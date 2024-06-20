---@type LazySpec
return {
  "someone-stole-my-name/yaml-companion.nvim",
  ft = { "yaml" },
  opts = {
    builtin_matchers = {
      kubernetes = { enabled = true },
    },
  },
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = function(_, opts)
    local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
    local astrolsp_opts = (astrolsp_avail and astrolsp.lsp_opts "rust_analyzer") or {}
    local cfg = require("yaml-companion").setup(opts)
    cfg = require("astrocore").extend_tbl(astrolsp_opts, cfg)
    require("lspconfig")["yamlls"].setup(cfg)
    require("telescope").load_extension "yaml_schema"
  end,
}
