local is_available = require("astrocore").is_available

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

local mappings = {
  n = {
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["J"] = { "mzJ`z" },
    ["<M-j>"] = { ":m .+1<CR>==", desc = "Move line one step below" },
    ["<M-k>"] = { ":m .-2<CR>==", desc = "Move line one step above" },
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
    ["<Leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" },
    ["<Leader>gR"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" },
    ["<Leader>h"] = { "<Cmd>noh<CR>", desc = "Remove search highlight" },
    ["<Leader>L"] = {
      function() require("notify").dismiss { pending = true, silent = true } end,
      desc = "Dismiss all notifictions",
    },
    ["<Leader>o"] = { name = "Obsidian", desc = "󱞁 Obsidian" },
    ["<Leader>/"] = false,
    ["|"] = false,
    ["\\"] = false,
  },
  v = {
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
    ["<M-j>"] = { ":m '>+1<CR>gv-gv", desc = "Move line one step below" },
    ["<M-k>"] = { ":m '<-2<CR>gv-gv", desc = "Move line one step above" },
    ["<Leader>/"] = false,
    ["<Tab>"] = false,
    ["<S-Tab>"] = false,
    ["<Leader>o"] = { name = "Obsidian", desc = "󱞁 Obsidian" },
  },
  x = {
    ["p"] = { "p:let @+=@0<CR>" },
  },
}

if is_available "alpha-nvim" then
  mappings.n["<Leader>H"] = {
    function()
      local wins = vim.api.nvim_tabpage_list_wins(0)
      if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
        vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
      end
      require("alpha").start(false, require("alpha").default_config)
    end,
    desc = "Home Screen",
  }
end

if is_available "neo-tree.nvim" then
  mappings.n["<Leader>O"] = {
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
    desc = "Toggle Explorer Focus",
  }
end

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
        source = true,
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
    mappings = mappings,
  },
}
