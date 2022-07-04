-- TODO: ggandor/lightspeed.nvim
-- TODO: weilbith/nvim-code-action-menu
-- TODO: dap plugins
-- TODO: ahmedkhalf/project.nvim
-- TODO: nvim-treesitter-textobjects
-- TODO: sindrets/diffview.nvim
-- TODO: kylechui/nvim-surround
-- TODO: nvim-neotest/neotest
local plugins = {
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
  {
    "David-Kunz/cmp-npm",
    config = function()
      require "user.cmp_npm"
    end,
  },

  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "jose-elias-alvarez/null-ls.nvim",
  "ray-x/lsp_signature.nvim",
  "b0o/schemastore.nvim",
  "folke/lua-dev.nvim",
  {
    "j-hui/fidget.nvim",
    config = function()
      require "user.fidget"
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require "user.illuminate"
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
  },
  {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "user.nvim-gps"
    end,
  },
  --[[ {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  }, ]]

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
  },
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/playground",
  "windwp/nvim-ts-autotag",
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
    -- event = "BufReadPost",
    requires = "numToStr/Comment.nvim",
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require "user.todo-comments"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "user.gitsigns"
    end,
    event = "BufRead",
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
    disable = true,
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
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "user.colorizer"
    end,
  },

  {
    "folke/trouble.nvim",
    config = function()
      require "user.trouble"
    end,
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require "user.dressing"
    end,
  },
}
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup {
  function(use)
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
}
