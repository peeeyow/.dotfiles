-- local format = require("user.lsp.handlers").format

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
--     ["e"] = { [[<CMD>:NvimTreeToggle<CR>]], "File Explorer" },
--     -- https://github.com/folke/which-key.nvim/issues/173
--     ["f"] = {
--       "<cmd>lua require('telescope.builtin').find_files()<cr>",
--       "Find files",
--     },
--     ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
--     ["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
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
        ["<leader>"] = "SPC",
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
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register({
        ["<leader>"] = { "Leader options" },
        ["<leader>b"] = { name = "Buffer" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>x"] = { name = "Swap" },
      }, {
        mode = "n",
        prefix = nil,
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      })
    end,
  },
}
