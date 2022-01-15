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

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
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

-- return packer.startup(function(use)

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
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  --[[
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)--]]
