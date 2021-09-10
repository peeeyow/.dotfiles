-- auto install packer.nvimvim.cmd("packadd packer.nvim")
local M = {}

function M:init()
    local cmd = vim.cmd
    local fn = vim.fn

    -- packer.nvim directory
    local packer_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

    -- check if packer is installed
    if fn.empty(fn.glob(packer_path)) > 0 then
        print("Cloning packer..")
        -- clone packer.nvim
        fn.system(
            {
                "git",
                "clone",
                "https://github.com/wbthomason/packer.nvim",
                "--depth",
                "20",
                packer_path
            }
        )
    end

    -- include packer.nvim to neovim packages
    cmd("packadd packer.nvim")

    -- load packer.nvim
    local is_packer_available, packer = pcall(require, "packer")

    -- check if packer was installed
    if not is_packer_available then
        error("packer installation error")
    end

    -- some config for packer.nvim
    -- more on https://github.com/wbthomason/packer.nvim/blob/master/doc/packer.txt
    packer.init {
        display = {
            open_fn = function()
                return require("packer.util").float {border = "single" }
            end
        },
        git = {
            clone_timeout = 180 -- Timeout, in seconds, for git clones
        }
    }

    -- add to class packer
    self.packer = packer
    return self
end

function M:load_plugins(plugins)
    return self.packer.startup(function()
        for _, plugin in ipairs(plugins) do
            use(plugin)
        end
    end)
end

return {
    init = function ()
        return M:init()
    end
}
