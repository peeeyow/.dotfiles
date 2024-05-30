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
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = true,
    },
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
    options = {
      opt = {
        fillchars = {
          horiz = "━",
          horizup = "┻",
          horizdown = "┳",
          vert = "┃",
          vertleft = "┫",
          vertright = "┣",
          verthoriz = "╋",
        },
        wrap = true,
        shortmess = vim.tbl_deep_extend("force", vim.opt.shortmess:get(), { c = true }),
        nrformats = vim.opt.nrformats + { "alpha", "octal", "hex" },
        whichwrap = vim.opt.whichwrap + "<>[]hl",
        foldlevel = 99,
        foldlevelstart = -1,
      },
      g = {
        resession_enabled = true,
        markdown_recommended_style = false,
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
