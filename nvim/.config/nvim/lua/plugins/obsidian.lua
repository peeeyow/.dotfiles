local prefix = "<Leader>o"

---@type LazySpec
return {
  "obsidian-nvim/obsidian.nvim",
  init = function() vim.g.obsidian_default_keymap = false end,
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md",
  },
  keys = {
    {
      prefix .. "nl",
      ":Obsidian new /literature/",
      desc = "Create new Literature Obsidian Note",
    },
    {
      prefix .. "np",
      ":Obsidian new /permanent/",
      desc = "Create new Permanent Obsidian Note",
    },
    { prefix .. "p", "<Cmd>Obsidian paste_img<CR>", desc = "Paste image from clipboard" },
    { prefix .. "o", "<Cmd>Obsidian open<CR>", desc = "Open current buffer in Obsidian" },
    { prefix .. "q", "<Cmd>Obsidian quick_switch<CR>", desc = "Switch notes" },
    { prefix .. "f", "<Cmd>Obsidian follow_link<CR>", desc = "Follow link" },
    { prefix .. "b", "<Cmd>Obsidian backlinks<CR>", desc = "Open Backlinks" },
    { prefix .. "l", "<Cmd>Obsidian links<CR>", desc = "Open Backlinks" },
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
    legacy_commands = false,

    workspaces = {
      {
        name = "main",
        path = vim.env.HOME .. "/obsidian/main-vault",
        overrides = {
          file = {
            ignore_filters = {
              "AGENTS.md",
              ".agents/**/*.md",
            },
          },
        },
      },
    },

    notes_subdir = "fleeting",
    new_notes_location = "current_dir",

    link = {
      style = function(opts)
        local path = opts.path and opts.path ~= "" and "/" .. opts.path or ""
        return require("obsidian.builtin").markdown_link(vim.tbl_extend("force", opts, { path = path }))
      end,
      format = "absolute",
      auto_update = true,
    },

    note_id_func = function(title)
      local suffix = vim.trim((title or ""):gsub("[^A-Za-z0-9%s_-]", "")):gsub("%s+", "_"):lower()
      if suffix == "" then
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(97, 122))
        end
      end
      return tostring(os.date "%Y%m%d%H%M%S") .. "-" .. suffix
    end,

    frontmatter = {
      -- Reference frontmatter is owned by scripts/zotcite_to_notes.py.
      enabled = function(path) return not vim.startswith(tostring(path), "references/") end,
      func = function(note)
        if note.title then note:add_alias(note.title) end
        local out = {
          id = note.id,
          aliases = note.aliases,
          tags = note.tags,
        }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
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
    note = { template = "permanent.md" },

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
      img_name_func = function() return "" end,
    },

    open = {
      use_advanced_uri = true,
    },
    ui = {
      enable = false,
    },

    callbacks = {
      post_setup = function()
        -- img_name_func only sets the prompt default; normalize the final filename before saving.
        local img = require "obsidian.img_paste"
        local Path = require "obsidian.path"
        local api = require "obsidian.api"
        local paste = img.paste
        img.paste = function(path, img_type)
          path = Path.new(path)
          if path == Path.new(api.resolve_attachment_path "") then
            return paste(path / Obsidian.opts.note_id_func(), img_type)
          end
          local name = Obsidian.opts.note_id_func(path.stem) .. (path.suffix or ""):lower()
          return paste((path:parent() or Path.new ".") / name, img_type)
        end
      end,
      enter_note = function(note)
        if vim.bo[note.bufnr].filetype == "neo-tree" then return end
        local actions = require "obsidian.actions"
        vim.keymap.set("n", "<CR>", actions.smart_action, {
          expr = true,
          buffer = note.bufnr,
          desc = "Obsidian Smart Action",
        })
        vim.keymap.set("n", "]o", function() actions.nav_link "next" end, {
          buffer = note.bufnr,
          desc = "Obsidian Next Link",
        })
        vim.keymap.set("n", "[o", function() actions.nav_link "prev" end, {
          buffer = note.bufnr,
          desc = "Obsidian Previous Link",
        })
      end,
    },
  },
}
