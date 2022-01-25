local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20,
    },
    presets = {
      operators = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "↩",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local normal = {
  opts = {
    mode = "n",
    prefix = nil,
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  },
  mappings = {
    ["<C-_>"] = { [[<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$]], "Line Comment" },
    ["[b"] = { ":BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["]b"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
    ["<C-\\>"] = { "Open Last Terminal" },
    ["<C-Left"] = { "Resize Left" },
    ["<C-Down"] = { "Resize Down" },
    ["<C-Up"] = { "Resize Up" },
    ["<C-Right"] = { "Resize Right" },
    ["<C-h>"] = { "Move to Left Window" },
    ["<C-j>"] = { "Move to Down Window" },
    ["<C-k>"] = { "Move to Up Window" },
    ["<C-l>"] = { "Move to Right Window" },
    ["<M-j>"] = { "Move Line One Step Below" },
    ["<M-k>"] = { "Move Line One Step Above" },
    ["K"] = { "Show Hover (LSP) " },
    ["<leader>"] = { "Leader Options" },
  },
}

local visual = {
  opts = {
    mode = "x",
    prefix = nil,
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  },
  mappings = {
    ["<C-_>"] = {
      [[<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>]],
      "Line Comment",
    },
  },
}

local leader = {
  opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  },
  mappings = {
    ["c"] = { "Close Buffer" },
    ["e"] = { [[<CMD>lua require("user.tree-toggle").toggle()<CR>]], "File Explorer" },
    ["<"] = { ":BufferLineMovePrev<CR>", "Move Buffer to Left" },
    [">"] = { ":BufferLineMoveNext<CR>", "Move Buffer to Right" },
    b = {
      name = "Buffer",
      ["p"] = { ":BufferLinePick<CR>", "Pick Buffer" },
      ["t"] = { ":BufferLineSortByTabs<CR>", "Sort buffers by Tab" },
      ["d"] = { ":BufferLineSortByDirectory<CR>", "Sort buffers by Directory" },
      ["e"] = { ":BufferLineSortByExtension<CR>", "Sort buffers by Extension" },
    },
  },
}

local keymaps = { normal, visual, leader }

for _, keymap in ipairs(keymaps) do
  which_key.register(keymap.mappings, keymap.opts)
end
