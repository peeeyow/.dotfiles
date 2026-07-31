local prefix = "<Leader>o"

---@type LazySpec
return {
  "obsidian-nvim/obsidian.nvim",
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md",
  },
  keys = {
    {
      prefix .. "n",
      ":Obsidian new ",
      desc = "Create new Obsidian Note",
    },
    { prefix .. "p", "<Cmd>Obsidian paste_img<CR>", desc = "Paste image from clipboard" },
    { prefix .. "o", "<Cmd>Obsidian open<CR>", desc = "Open current buffer in Obsidian" },
    { prefix .. "q", "<Cmd>Obsidian quick_switch<CR>", desc = "Switch notes" },
    { prefix .. "f", "<Cmd>Obsidian follow_link<CR>", desc = "Switch notes" },
    { prefix .. "b", "<Cmd>Obsidian backlinks<CR>", desc = "Open Backlinks" },
    { prefix .. "T", "<cmd>Obsidian today<CR>", desc = "Create a new daily  note" },
    { prefix .. "t", "<Cmd>Obsidian template<CR>", desc = "Search for note template" },
    { prefix .. "w", "<Cmd>Obsidian search<CR>", desc = "Search for notes in vault" },
    { prefix .. "e", ":Obsidian extract_note<CR>", mode = { "v" }, desc = "Extract selection into new note" },
    { prefix .. "l", ":Obsidian link<CR>", mode = { "v" }, desc = "Link selection to existing note" },
    { prefix .. "L", ":Obsidian link_new<CR>", mode = { "v" }, desc = "Create new link for current selection" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
    "Saghen/blink.cmp",
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = "main",
        path = vim.env.HOME .. "/obsidian/main-vault",
      },
    },

    notes_subdir = "fleeting",
    new_notes_location = "current_dir",

    link = {
      -- style = "markdown",
      style = function(opts)
        local util = require("obsidian").util
        local anchor = opts.anchor and opts.anchor.anchor or ""
        local header = opts.anchor and util.format_anchor_label(opts.anchor) or ""
        local path = util.urlencode(opts.path, { keep_path_sep = true })
        return string.format("[%s%s](/%s%s)", opts.label, header, path, anchor)
      end,
      format = "absolute",
      auto_update = true,
    },

    note_id_func = function(title)
      local suffix = ""
      if title ~= nil and #title:gsub("%s+", "") > 0 then
        suffix = title:gsub("[^A-Za-z0-9%s'\"]", ""):gsub("%s+", "-"):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.date "%Y%m%d%H%M%S") .. "-" .. suffix
    end,

    frontmatter = {
      enabled = true,
      func = function(note)
        if note.title then note:add_alias(note.title) end
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        if note.metadata ~= nil and vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    },

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M:%s",
    },

    picker = { "snack" },

    daily_notes = {
      folder = "dailies",
    },

    attachments = {
      folder = "attachments/images",
      img_text_func = function(path)
        local name = vim.fs.basename(tostring(path))
        return string.format("![%s](/%s)", name, path:vault_relative_path())
      end,
      img_name_func = function() return tostring(os.date "%Y%m%d%H%M%S") end,
    },

    open = {
      use_advanced_uri = true,
    },
  },
}
