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
      ["<leader>xp"] = "@parameter.inner",
      ["<leader>xa"] = "@attribute.outer",
    },
    swap_previous = {
      ["<leader>xP"] = "@parameter.inner",
      ["<leader>xA"] = "@attribute.outer",
    },
  },
  move = {
    enable = true,
    set_jumps = true,
    goto_next_start = {
      ["]f"] = "@function.outer",
      ["]x"] = "@class.outer",
      ["]a"] = "@attribute.outer",
      ["]p"] = "@parameter.inner",
    },
    goto_next_end = {
      ["]F"] = "@function.outer",
      ["]X"] = "@class.outer",
      ["]A"] = "@attribute.outer",
      ["]P"] = "@parameter.inner",
    },
    goto_previous_start = {
      ["[f"] = "@function.outer",
      ["[x"] = "@class.outer",
      ["[a"] = "@attribute.outer",
      ["[p"] = "@parameter.inner",
    },
    goto_previous_end = {
      ["[F"] = "@function.outer",
      ["[X"] = "@class.outer",
      ["[A"] = "@attribute.outer",
      ["[P"] = "@parameter.inner",
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
      },
      textobjects = textobjects,
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
