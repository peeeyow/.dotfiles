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

local plugins_status_ok, plugins = pcall(require, "user.plugins")
if not plugins_status_ok then
  return
end

return packer.startup {
  function(use)
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    -- compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  },
}
