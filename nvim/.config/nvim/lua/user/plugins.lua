return {
  -- Have packer manage itself
  "wbthomason/packer.nvim",
  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/popup.nvim",
  -- Useful lua functions used ny lots of plugins
  "nvim-lua/plenary.nvim",

  -- cmp plugins
  -- The completion plugin
  "hrsh7th/nvim-cmp",
  -- buffer completions
  "hrsh7th/cmp-buffer",
  -- path completions
  "hrsh7th/cmp-path",
  -- cmdline completions
  "hrsh7th/cmp-cmdline",
  -- snippet completions
  "saadparwaiz1/cmp_luasnip",
  -- lsp completions
  "hrsh7th/cmp-nvim-lsp",
  -- lua completions
  "hrsh7th/cmp-nvim-lua",

  -- LSP
  -- enable LSP
  "neovim/nvim-lspconfig",
  -- simple to language server installer
  "williamboman/nvim-lsp-installer",

  -- snippets
  --snippet engine
  "L3MON4D3/LuaSnip",
  -- a bunch of snippets to use
  "rafamadriz/friendly-snippets",

  -- telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-media-files.nvim",

  -- Colorschemes
  "folke/tokyonight.nvim",
  "lunarvim/darkplus.nvim",
  "joshdick/onedark.vim",

  -- Nvim-tree
  "kyazdani42/nvim-tree.lua",

  -- Autopair
  "windwp/nvim-autopairs",

  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
}
