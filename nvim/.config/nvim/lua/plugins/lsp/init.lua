return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    keys = {

      {
        "<leader>la",
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "Code action",
      },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      {
        "<leader>ll",
        function()
          vim.lsp.codelens.run()
        end,
        desc = "CodeLens action",
      },
      {
        "<leader>ld",
        "<cmd>Trouble document_diagnostics<cr>",
        desc = "List document diagnostics",
      },
      {
        "<leader>lr",
        function()
          vim.lsp.buf.rename()
        end,
        desc = "Rename",
      },
      {
        "<leader>lt",
        function()
          vim.lsp.buf.type_definition()
        end,
        desc = "Type definition",
      },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
    },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "RRethy/vim-illuminate",
      "SmiteshP/nvim-navic",

      "b0o/schemastore.nvim",
      "folke/neodev.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "someone-stole-my-name/yaml-companion.nvim",
    },
    config = function()
      require("plugins.lsp.handlers").setup()
      require "plugins.lsp.setup"
    end,
  },
}
