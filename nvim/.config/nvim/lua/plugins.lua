return {
    -- let packer manage itself
    {
        "wbthomason/packer.nvim",
        event = "VimEnter"
    },

    -- side navigation bar
    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require "plugins.nvimtree"
        end,
        requires = "kyazdani42/nvim-web-devicons"
    },

    -- code AST
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        config = function()
            require "plugins.treesitter"
        end,
    },
    {
        "nvim-treesitter/playground",
        after = "nvim-treesitter",
    },
    {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter"
    },

    -- auto completions and snippet
    {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require "plugins.compe"
        end,
        wants = "LuaSnip",
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function()
                    require "plugins.luasnip"
                end
            },
            {
                "rafamadriz/friendly-snippets",
                event = "InsertCharPre"
            }
        }
    },

    -- lsp support


    -- neovim lsp
    -- already lazy loading
    {
        "neovim/nvim-lspconfig",
    },

    {
        "kabouzeid/nvim-lspinstall",
        event = "VimEnter",
        config = function()
            require "lsp"
        end,
    },

    -- others

    -- auto pair brackets
    {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require "plugins.autopairs"
        end
    },
}
