return {
  "wbthomason/packer.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",

  {"hrsh7th/nvim-cmp",
  config = function ()
    require "user.cmp"
  end,
  requires = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  "rafamadriz/friendly-snippets",
  {"L3MON4D3/LuaSnip",
    config = function ()
      require("luasnip/loaders/from_vscode").lazy_load()
    end
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",


  {"nvim-telescope/telescope.nvim",
    config = function ()
      require "user.telescope"
    end
  },
  "nvim-telescope/telescope-media-files.nvim",

  -- Colorschemes
  "folke/tokyonight.nvim",
  "lunarvim/darkplus.nvim",
  "joshdick/onedark.vim",
  "LunarVim/onedarker.nvim",

  {"kyazdani42/nvim-tree.lua",
  config = function ()
    require "user.nvim-tree"
  end},

  {"windwp/nvim-autopairs",
    config = function ()
      require "user.autopairs"
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
      require "user.treesitter"
    end,
    run = ":TSUpdate",
  },
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/playground",
  {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require "user.comment"
    end
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost"
  },
}
