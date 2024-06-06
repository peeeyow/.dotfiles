local Input = require "nui.input"
local event = require("nui.utils.autocmd").event

local check_passthrough = function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<Cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end

local open_new_window = function(command)
  return function()
    local input = Input({
      position = "50%",
      size = {
        width = 20,
      },
      border = {
        style = "single",
        text = {
          top = "Enter filename",
          top_align = "center",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
      },
    }, {
      prompt = "> ",
      default_value = "",
      on_submit = function(value) vim.cmd(command .. value) end,
    })
    input:on(event.BufLeave, function() input:unmount() end)
    input:map("i", "<Esc>", function() input:unmount() end, { noremap = true })
    input:mount()
  end
end

local create_new_note = open_new_window "ObsidianNew "
local paste_image = open_new_window "ObsidianPasteImg "

local prefix = "<Leader>o"

---@type LazySpec
return {
  "epwalsh/obsidian.nvim",
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md",
  },
  cmd = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianBacklinks",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTemplate",
    "ObsidianSearch",
    "ObsidianLink",
    "ObsidianLinkNew",
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
      create_new_note,
      desc = "Create new Obsidian Note",
    },
    { prefix .. "p", "<Cmd>ObsidianPasteImg<CR>", desc = "Paste image from clipboard" },
    { prefix .. "o", "<Cmd>ObsidianOpen<CR>", desc = "Open current buffer in Obsidian" },
    { prefix .. "f", "<Cmd>ObsidianQuickSwitch<CR>", desc = "Switch notes" },
    { prefix .. "b", "<Cmd>ObsidianBacklinks<CR>", desc = "Open Backlinks" },
    { prefix .. "T", "<Cmd>ObsidianToday<CR>", desc = "Create a new daily  note" },
    { prefix .. "Y", "<Cmd>ObsidianYesterday<CR>", desc = "Open yesterday's daily note" },
    { prefix .. "t", "<Cmd>ObsidianTemplate<CR>", desc = "Search for note template" },
    { prefix .. "w", "<Cmd>ObsidianSearch<CR>", desc = "Search for notes in vault" },
    { prefix .. "l", ":ObsidianLink<CR>", mode = { "v" }, desc = "Link selection to existing note" },
    { prefix .. "L", ":ObsidianLinkNew<CR>", mode = { "v" }, desc = "Create new link for current selection" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
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

    mappings = {},

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

    follow_url_func = vim.ui.open or require("astrocore").system_open,

    use_advanced_uri = true,
    finder = "telescope.nvim",
  },
}
