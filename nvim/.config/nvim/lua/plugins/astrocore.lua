local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      update_in_insert = true,
      signs = {
        active = signs,
      },
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },
        ["n"] = { "nzzzv" },
        ["N"] = { "Nzzzv" },
        ["J"] = { "mzJ`z" },
        ["<M-j>"] = { ":m .+1<cr>==", desc = "Move line one step below" },
        ["<M-k>"] = { ":m .-2<cr>==", desc = "Move line one step above" },
        ["dd"] = {
          function()
            if vim.api.nvim_get_current_line():match "^%s*$" then
              return [["_dd]]
            else
              return "dd"
            end
          end,
          expr = true,
        },
        ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" },
        ["<leader>gR"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" },
        ["<leader>h"] = { "<cmd>noh<cr>", desc = "Remove search highlight" },
        ["<leader>L"] = {
          function() require("notify").dismiss { pending = true, silent = true } end,
          desc = "Dismiss all notifictions",
        },
        ["<leader>o"] = { name = "Obsidian", desc = "󱞁 Obsidian" },
        ["<leader>/"] = false,
        ["|"] = false,
        ["\\"] = false,
      },
      v = {
        ["<"] = { "<gv" },
        [">"] = { ">gv" },
        ["<M-j>"] = { ":m '>+1<cr>gv-gv", desc = "Move line one step below" },
        ["<M-k>"] = { ":m '<-2<cr>gv-gv", desc = "Move line one step above" },
        ["<leader>/"] = false,
        ["<Tab>"] = false,
        ["<S-Tab>"] = false,
        ["<leader>o"] = { name = "Obsidian", desc = "󱞁 Obsidian" },
      },
      x = {
        ["p"] = { "p:let @+=@0<cr>" },
      },
    },
  },
}
