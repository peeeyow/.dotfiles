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
    ["<Leader>o"] = { desc = "󱞁 Obsidian" },
    ["<Leader>m"] = { desc = "Node Actions" },
    ["<Leader>M"] = { desc = "Molten" },
    ["<C-/>"] = { "gcc", remap = true, desc = "Line Comment" },
    ["<C-_>"] = { "gcc", remap = true, desc = "Line Comment" },

    ["<Leader>r"] = {
      function() require("snacks").image.hover() end,
    },
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
    ["<C-/>"] = { "gc", remap = true, desc = "Visual Line Comment" },
    ["<C-_>"] = { "gc", remap = true, desc = "Visual Line Comment" },
  },
}

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
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = false,
      underline = true,
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
        scrolloff = 8,
      },
      g = {
        resession_enabled = true,
        markdown_recommended_style = false,
      },
    },
    mappings = mappings,
    autocmds = {
      autodisableformatting = {
        {
          desc = "Disable auto formatting for anki markdowns.",
          event = "BufReadPre",
          pattern = vim.fn.expand "~" .. "/obsidian/main-vault/anki/*.md",
          group = "autodisableformatting",
          callback = function() vim.b.autoformat = false end,
        },
      },
    },
  },
}
