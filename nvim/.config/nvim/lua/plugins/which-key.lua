-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
--   return
-- end

-- local format = require("user.lsp.handlers").format

-- which_key.setup {
--   plugins = {
--     marks = true,
--     registers = true,
--     spelling = {
--       enabled = true,
--       suggestions = 20,
--     },
--     presets = {
--       operators = true,
--       windows = true,
--       nav = true,
--       z = true,
--       g = true,
--     },
--   },
--   key_labels = {
--     ["<space>"] = "SPC",
--     ["<cr>"] = "↩",
--     ["<tab>"] = "TAB",
--   },
--   icons = {
--     breadcrumb = "»",
--     separator = "➜",
--     group = "+",
--   },
--   popup_mappings = {
--     scroll_down = "<c-d>",
--     scroll_up = "<c-u>",
--   },
--   window = {
--     border = "rounded",
--     position = "bottom",
--     margin = { 1, 0, 1, 0 },
--     padding = { 2, 2, 2, 2 },
--     winblend = 0,
--   },
--   layout = {
--     height = { min = 4, max = 25 },
--     width = { min = 20, max = 50 },
--     spacing = 3,
--     align = "left",
--   },
--   ignore_missing = false,
--   hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
--   show_help = true,
--   triggers = "auto",
--   triggers_blacklist = {
--     i = { "j", "k" },
--     v = { "j", "k" },
--   },
-- }

-- local normal = {
--   opts = {
--     mode = "n",
--     prefix = nil,
--     buffer = nil,
--     silent = true,
--     noremap = true,
--     nowait = true,
--   },
--   mappings = {
--     ["<C-/>"] = { "Line Comment" },
--     ["<C-_>"] = { "Line Comment" },
--     ["<C-\\>"] = { "block comment" },
--     ["<C-Left"] = { "Resize Left" },
--     ["<C-Down"] = { "Resize Down" },
--     ["<C-Up"] = { "Resize Up" },
--     ["<C-Right"] = { "Resize Right" },
--     ["<C-h>"] = { "Move to Left Window" },
--     ["<C-j>"] = { "Move to Down Window" },
--     ["<C-k>"] = { "Move to Up Window" },
--     ["<C-l>"] = { "Move to Right Window" },
--     ["<M-j>"] = { "Move Line One Step Below" },
--     ["<M-k>"] = { "Move Line One Step Above" },
--     ["K"] = { "Show Hover (LSP) " },
--     ["<leader>"] = { "Leader Options" },
--     ["[b"] = { ":BufferLineCyclePrev<CR>", "Prev Buffer" },
--     ["]b"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
--     ["[c"] = { "Prev Hunk" },
--     ["]c"] = { "Next Hunk" },
--     ["[t"] = { "Prev Trouble Item" },
--     ["]t"] = { "Next Trouble Item" },
--     ["]f"] = { "Next Function Start" },
--     ["[f"] = { "Previous Function Start" },
--     ["]F"] = { "Next Function End" },
--     ["[F"] = { "Previous Function End" },
--     ["]x"] = { "Next Class Start" },
--     ["[x"] = { "Previous Class Start" },
--     ["]X"] = { "Next Class End" },
--     ["[X"] = { "Previous Class End" },
--     ["]a"] = { "Next Attribute Start" },
--     ["[a"] = { "Previous Attribute Start" },
--     ["]A"] = { "Next Attribute End" },
--     ["[A"] = { "Previous Attribute End" },
--     ["]p"] = { "Next Parameter Start" },
--     ["[p"] = { "Previous Parameter Start" },
--     ["]P"] = { "Next Parameter End" },
--     ["[P"] = { "Previous Parameter End" },
--   },
-- }

-- local visual = {
--   opts = {
--     mode = "x",
--     prefix = nil,
--     buffer = nil,
--     silent = true,
--     noremap = true,
--     nowait = true,
--   },
--   mappings = {
--     ["<C-_>"] = { "Line Comment" },
--     ["<C-/>"] = { "Line Comment" },
--     ["<C-\\>"] = { "Block Comment" },
--   },
-- }

-- local n_g = {
--   opts = {
--     mode = "n",
--     prefix = "g",
--     buffer = nil,
--     silent = true,
--     noremap = true,
--     nowait = true,
--   },
--   mappings = {
--     ["D"] = { "Goto Declaration" },
--     ["d"] = { "Goto Definition" },
--     ["I"] = { "Goto Implementation" },
--     ["r"] = { "Goto References" },
--     ["l"] = { "Show Diagnostics" },
--     ["s"] = { "Show Signature" },
--     ["R"] = { "<cmd>Trouble lsp_references<cr>", "Show References Trouble" },
--   },
-- }

-- local n_leader = {
--   opts = {
--     mode = "n",
--     prefix = "<leader>",
--     buffer = nil,
--     silent = true,
--     noremap = true,
--     nowait = true,
--   },
--   mappings = {
--     ["c"] = { "Close Buffer" },
--     ["e"] = { [[<CMD>:NvimTreeToggle<CR>]], "File Explorer" },
--     -- https://github.com/folke/which-key.nvim/issues/173
--     ["<lt>"] = { ":BufferLineMovePrev<CR>", "Move Buffer to Left" },
--     [">"] = { ":BufferLineMoveNext<CR>", "Move Buffer to Right" },
--     ["f"] = {
--       "<cmd>lua require('telescope.builtin').find_files()<cr>",
--       "Find files",
--     },
--     ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
--     ["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
--     ["b"] = {
--       name = "Buffer",
--       ["p"] = { ":BufferLinePick<CR>", "Pick Buffer" },
--       ["t"] = { ":BufferLineSortByTabs<CR>", "Sort buffers by Tab" },
--       ["d"] = { ":BufferLineSortByDirectory<CR>", "Sort buffers by Directory" },
--       ["e"] = { ":BufferLineSortByExtension<CR>", "Sort buffers by Extension" },
--       ["b"] = {
--         "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--         "Buffers",
--       },
--       ["<"] = {
--         "<CMD>BufferLineMovePrev<CR>",
--         "Move buffer to left",
--       },
--       [">"] = {
--         "<CMD>BufferLineMoveNext<CR>",
--         "Move buffer to right",
--       },
--     },
--     ["g"] = {
--       name = "Git",
--       ["g"] = { "<CMD>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
--       ["l"] = { '<CMD>lua require"gitsigns".blame_line{full=false}<CR>', "Blame" },
--       ["s"] = { "<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk" },
--       ["S"] = { "<CMD>Gitsigns stage_buffer<CR>", "Stage Buffer" },
--       ["u"] = { "<CMD>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
--       ["r"] = { "<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk" },
--       ["R"] = { "<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer" },
--       ["p"] = { "<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk" },
--       ["o"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--       ["b"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--       ["c"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--       ["d"] = {
--         "<cmd>Gitsigns diffthis HEAD<cr>",
--         "Diff",
--       },
--     },
--     ["l"] = {
--       name = "LSP",
--       ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--       ["f"] = {
--         function()
--           format(0)
--         end,
--         "Format",
--       },
--       ["i"] = { "<cmd>LspInfo<cr>", "Info" },
--       ["I"] = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
--       ["j"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
--       ["k"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
--       ["l"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--       ["q"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
--       ["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--       ["t"] = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
--       ["s"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--       ["S"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
--     },
--     ["p"] = {
--       name = "Packer",
--       ["c"] = { "<cmd>PackerCompile<cr>", "Compile" },
--       ["i"] = { "<cmd>PackerInstall<cr>", "Install" },
--       ["s"] = { "<cmd>PackerSync<cr>", "Sync" },
--       ["S"] = { "<cmd>PackerStatus<cr>", "Status" },
--       ["u"] = { "<cmd>PackerUpdate<cr>", "Update" },
--     },
--     ["s"] = {
--       name = "Search",
--       ["g"] = { "<cmd>Telescope git_files<cr>", "Checkout branch" },
--       ["b"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--       ["c"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--       ["h"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
--       ["M"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--       ["r"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--       ["R"] = { "<cmd>Telescope registers<cr>", "Registers" },
--       ["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--       ["C"] = { "<cmd>Telescope commands<cr>", "Commands" },
--       ["p"] = { "<cmd>Telescope project<cr>", "Projects" },
--       ["m"] = { "<cmd>Telescope media_files<cr>", "Media Files" },
--       ["d"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
--       ["w"] = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
--       ["n"] = { "<cmd>Telescope noice<cr>", "Noice" },
--       ["f"] = { "<cmd>Telescope filetypes<cr>", "Noice" },
--     },
--     ["t"] = {
--       name = "Trouble",
--       ["r"] = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
--       ["w"] = { "<cmd>Trouble workspace_diagnostics<cr>", "Open Trouble Workspace Diagnostics" },
--       ["d"] = { "<cmd>Trouble document_diagnostics<cr>", "Open Trouble Document Diagnostics" },
--       ["t"] = { "<cmd>Trouble todo<cr>", "Open todo Trouble" },
--     },
--     ["x"] = {
--       name = "Treesitter Objects Swap",
--       ["p"] = { "Swap current Parameter with next" },
--       ["P"] = { "Swap current Parameter with previous" },
--       ["a"] = { "Swap current Attribute with previous" },
--       ["A"] = { "Swap current Attribute with previous" },
--     },
--   },
-- }

-- local keymaps = { normal, visual, n_leader, n_g }

-- for _, keymap in ipairs(keymaps) do
--   which_key.register(keymap.mappings, keymap.opts)
-- end

return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
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
    },
  },
}
