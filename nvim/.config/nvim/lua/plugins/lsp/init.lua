return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
      "ray-x/lsp_signature.nvim",
      "RRethy/vim-illuminate",
      "SmiteshP/nvim-navic",

      "b0o/schemastore.nvim",
      "folke/neodev.nvim",
      "jose-elias-alvarez/typescript.nvim",
    },
    config = function()
      require("plugins.lsp.handlers").setup()
      require "plugins.lsp.setup"
    end,
  },
}
