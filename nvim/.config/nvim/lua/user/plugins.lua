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

return packer.startup(function(use)

  -- Have packer manage itself
  use "wbthomason/packer.nvim"
  -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/popup.nvim"
  -- Useful lua functions used ny lots of plugins
  use "nvim-lua/plenary.nvim"

  -- cmp plugins
  -- The completion plugin
  use "hrsh7th/nvim-cmp"
  -- buffer completions
  use "hrsh7th/cmp-buffer"
  -- path completions
  use "hrsh7th/cmp-path"
  -- cmdline completions
  use "hrsh7th/cmp-cmdline"
  -- snippet completions
  use "saadparwaiz1/cmp_luasnip"
  -- lsp completions
  use "hrsh7th/cmp-nvim-lsp"
  -- lua completions
  use "hrsh7th/cmp-nvim-lua"

  -- LSP
  -- enable LSP
  use "neovim/nvim-lspconfig"
  -- simple to use language server installer
  use "williamboman/nvim-lsp-installer"

  -- snippets
  --snippet engine
  use "L3MON4D3/LuaSnip"
  -- a bunch of snippets to use
  use "rafamadriz/friendly-snippets"

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Colorschemes
  use "folke/tokyonight.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
