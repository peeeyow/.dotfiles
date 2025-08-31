local check_passthrough = function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<Cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end

local prefix = "<Leader>o"

---@type LazySpec
return {
  "obsidian-nvim/obsidian.nvim",
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md",
  },
  cmd = {
    "Obsidian open",
    "Obsidian new",
    "Obsidian quickSwitch",
    "Obsidian followLink",
    "Obsidian backlinks",
    "Obsidian template",
    "Obsidian search",
    "Obsidian link",
    "Obsidian linkNew",
  },
  keys = {
    {
      "gf",
      check_passthrough,
      noremap = false,
      expr = true,
    },
    {
      prefix .. "n",
      ":ObsidianNew ",
      desc = "Create new Obsidian Note",
    },
    { prefix .. "p", "<Cmd>Obsidian paste_img<CR>", desc = "Paste image from clipboard" },
    { prefix .. "o", "<Cmd>Obsidian open<CR>", desc = "Open current buffer in Obsidian" },
    { prefix .. "f", "<Cmd>Obsidian quickSwitch<CR>", desc = "Switch notes" },
    { prefix .. "b", "<Cmd>Obsidian backlinks<CR>", desc = "Open Backlinks" },
    { prefix .. "T", "<cmd>Obsidian today<CR>", desc = "Create a new daily  note" },
    { prefix .. "Y", "<Cmd>Obsidian yesterday<CR>", desc = "Open yesterday's daily note" },
    { prefix .. "t", "<Cmd>Obsidian template<CR>", desc = "Search for note template" },
    { prefix .. "w", "<Cmd>Obsidian search<CR>", desc = "Search for notes in vault" },
    { prefix .. "l", ":ObsidianLink<CR>", mode = { "v" }, desc = "Link selection to existing note" },
    { prefix .. "L", ":ObsidianLinkNew<CR>", mode = { "v" }, desc = "Create new link for current selection" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
    "Saghen/blink.cmp",
  },
  opts = {
    workspaces = {
      {
        name = "main",
        path = vim.env.HOME .. "/obsidian/main-vault",
      },
    },

    notes_subdir = "fleeting",

    daily_notes = {
      folder = "dailies",
    },

    completion = {
      nvim_cmp = false,
      blink = true,
    },

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },

    new_notes_location = "current_dir",

    attachments = {
      img_folder = "attachments/images",
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

    image_name_func = function() return tostring(os.date "%Y%m%d%H%M%S") end,

    disable_frontmatter = false,

    note_frontmatter_func = function(note)
      if note.title then note:add_alias(note.title) end
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    markdown_link_func = function(opts)
      local util = require("obsidian").util
      local anchor = opts.anchor and opts.anchor.anchor or ""
      local header = opts.anchor and util.format_anchor_label(opts.anchor) or ""
      local path = util.urlencode(opts.path, { keep_path_sep = true })
      return string.format("[%s%s](/%s%s)", opts.label, header, path, anchor)
    end,

    preferred_link_style = "markdown",
    follow_url_func = vim.ui.open,
    open = {
      use_advanced_uri = true,
    },
    picker = { "snack" },
  },
}
