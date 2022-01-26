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
    ["[b"] = { ":BufferLineCyclePrev<CR>", "Prev Buffer" },
    ["]b"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
    ["[c"] = { "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", "Prev Hunk" },
    ["]c"] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", "Next Hunk" },
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
    -- https://github.com/folke/which-key.nvim/issues/173
    ["<lt>"] = { ":BufferLineMovePrev<CR>", "Move Buffer to Left" },
    [">"] = { ":BufferLineMoveNext<CR>", "Move Buffer to Right" },
    ["f"] = {
      "<cmd>lua require('telescope.builtin').find_files()<cr>",
      "Find files",
    },
    ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    ["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
    ["b"] = {
      name = "Buffer",
      ["p"] = { ":BufferLinePick<CR>", "Pick Buffer" },
      ["t"] = { ":BufferLineSortByTabs<CR>", "Sort buffers by Tab" },
      ["d"] = { ":BufferLineSortByDirectory<CR>", "Sort buffers by Directory" },
      ["e"] = { ":BufferLineSortByExtension<CR>", "Sort buffers by Extension" },
      ["b"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers",
      },
    },
    ["g"] = {
      name = "Git",
      ["g"] = { "<CMD>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
      ["l"] = { '<CMD>lua require"gitsigns".blame_line{full=true}<CR>', "Blame" },
      ["s"] = { "<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk" },
      ["S"] = { "<CMD>Gitsigns stage_buffer<CR>", "Stage Buffer" },
      ["u"] = { "<CMD>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
      ["r"] = { "<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk" },
      ["R"] = { "<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer" },
      ["p"] = { "<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk" },
      ["o"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      ["b"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      ["c"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      ["d"] = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Diff",
      },
    },
    ["l"] = {
      name = "LSP",
      ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      ["d"] = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
      ["w"] = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
      ["f"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      ["i"] = { "<cmd>LspInfo<cr>", "Info" },
      ["I"] = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      ["j"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
      ["k"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
      ["l"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      ["q"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      ["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      ["s"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      ["S"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    },
    ["p"] = {
      name = "Packer",
      ["c"] = { "<cmd>PackerCompile<cr>", "Compile" },
      ["i"] = { "<cmd>PackerInstall<cr>", "Install" },
      ["s"] = { "<cmd>PackerSync<cr>", "Sync" },
      ["S"] = { "<cmd>PackerStatus<cr>", "Status" },
      ["u"] = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    ["s"] = {
      name = "Search",
      ["b"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      ["c"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      ["h"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      ["M"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      ["r"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      ["R"] = { "<cmd>Telescope registers<cr>", "Registers" },
      ["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      ["C"] = { "<cmd>Telescope commands<cr>", "Commands" },
    },

    ["t"] = {
      name = "Terminal",
      ["n"] = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      ["u"] = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      ["t"] = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      ["p"] = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      ["f"] = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
      ["h"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
      ["v"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
  },
}

local keymaps = { normal, visual, leader }

for _, keymap in ipairs(keymaps) do
  which_key.register(keymap.mappings, keymap.opts)
end
