return {
  "wbthomason/packer.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "user.cmp"
    end,
    requires = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  "rafamadriz/friendly-snippets",
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "tamago324/nlsp-settings.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "ray-x/lsp_signature.nvim",
  "b0o/schemastore.nvim",

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "user.telescope"
    end,
  },
  "nvim-telescope/telescope-media-files.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  "nvim-telescope/telescope-project.nvim",

  -- Colorschemes
  "folke/tokyonight.nvim",
  "lunarvim/darkplus.nvim",
  "joshdick/onedark.vim",
  "LunarVim/onedarker.nvim",

  "kyazdani42/nvim-web-devicons",
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "user.nvim-tree"
    end,
    requires = "kyazdani42/nvim-web-devicons",
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require "user.autopairs"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "user.treesitter"
    end,
    run = ":TSUpdate",
    commit = "d7c4ae886d90471b1839dd601887bdd6e882efd9",
  },
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/playground",
  {
    "lewis6991/spellsitter.nvim",
    config = function()
      require("spellsitter").setup()
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require "user.comment"
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "user.gitsigns"
    end,
    -- event = "BufRead"
  },

  {
    "andweeb/presence.nvim",
    config = function()
      require("presence"):setup()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "user.indent-blankline"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "user.bufferline"
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require "user.toggleterm"
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "user.lualine"
    end,
  },

  {
    "lewis6991/impatient.nvim",
    config = function()
      require "user.impatient"
    end,
  },

  {
    "folke/which-key.nvim",
    config = function()
      require "user.which-key"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "user.colorizer"
    end,
  },
}
