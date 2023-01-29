local playground = {
  enable = true,
  disable = {},
  updatetime = 25,
  persist_queries = false,
  keybindings = {
    toggle_query_editor = "o",
    toggle_hl_groups = "i",
    toggle_injected_languages = "t",
    toggle_anonymous_nodes = "a",
    toggle_language_display = "I",
    focus_language = "f",
    unfocus_language = "F",
    update = "R",
    goto_node = "<cr>",
    show_help = "?",
  },
}

local textobjects = {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ["af"] = { query = "@function.outer", desc = "Select all function region" },
      ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
      ["ac"] = { query = "@class.outer", desc = "Select all class region" },
      ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      ["al"] = { query = "@block.outer", desc = "Select all block region" },
      ["il"] = { query = "@block.inner", desc = "Select inner part of a block region" },
      ["aa"] = { query = "@attribute.outer", desc = "Select inner part of an attribute region" },
      ["ia"] = { query = "@attribute.inner", desc = "Select attribute region" },
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>xp"] = { query = "@parameter.inner", desc = "Swap current Parameter with next" },
      ["<leader>xa"] = { query = "@attribute.outer", desc = "Swap current Attribute with previous" },
    },
    swap_previous = {
      ["<leader>xP"] = { query = "@parameter.inner", desc = "Swap current Parameter with previous" },
      ["<leader>xA"] = { query = "@attribute.outer", desc = "Swap current Attribute with previous" },
    },
  },
  move = {
    enable = true,
    set_jumps = true,
    goto_next_start = {
      ["]f"] = { query = "@function.outer", desc = "Next Function Start" },
      ["]x"] = { query = "@class.outer", desc = "Next Class Start" },
      ["]a"] = { query = "@attribute.outer", desc = "Next Attribute Start" },
      ["]p"] = { query = "@parameter.inner", desc = "Next Parameter Start" },
    },
    goto_next_end = {
      ["]F"] = { query = "@function.outer", desc = "Next Function End" },
      ["]X"] = { query = "@class.outer", desc = "Next Class End" },
      ["]A"] = { query = "@attribute.outer", desc = "Next Attribute End" },
      ["]P"] = { query = "@parameter.inner", desc = "Next Parameter End" },
    },
    goto_previous_start = {
      ["[f"] = { query = "@function.outer", desc = "Previous Function Start" },
      ["[x"] = { query = "@class.outer", desc = "Previous Class Start" },
      ["[a"] = { query = "@attribute.outer", desc = "Previous Attribute Start" },
      ["[p"] = { query = "@parameter.inner", desc = "Previous Parameter Start" },
    },
    goto_previous_end = {
      ["[F"] = { query = "@function.outer", desc = "Previous Function End" },
      ["[X"] = { query = "@class.outer", desc = "Previous Class End" },
      ["[A"] = { query = "@attribute.outer", desc = "Previous Attribute End" },
      ["[P"] = { query = "@parameter.inner", desc = "Previous Parameter End" },
    },
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/playground",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-autopairs",
      "andymass/vim-matchup",
    },
    opts = {
      ensure_installed = "all",
      sync_install = false,
      ignore_install = { "" },
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
      playground = playground,
      indent = { enable = true, disable = { "python" } },
      autotag = {
        enable = true,
        disable = { "xml" },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          python = { __default = "# %s", __multiline = [[""" %s """]] },
        },
      },
      matchup = {
        enable = true,
        disable_virtual_text = true,
      },
      textobjects = textobjects,
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
