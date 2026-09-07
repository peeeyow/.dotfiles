---@type LazySpec
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    image = {
      doc = { enabled = true, inline = false },
      resolve = function(path, src)
        local api = require "obsidian.api"
        if not api.path_is_note(path) then return end
        if vim.startswith(src, "/") then return vim.fs.joinpath(tostring(api.resolve_workspace_dir(path)), src) end
        return api.resolve_attachment_path(src)
      end,
    },
    dashboard = {
      preset = {
        header = table.concat({
          "███    ██ ██    ██ ██ ███    ███",
          "████   ██ ██    ██ ██ ████  ████",
          "██ ██  ██ ██    ██ ██ ██ ████ ██",
          "██  ██ ██  ██  ██  ██ ██  ██  ██",
          "██   ████   ████   ██ ██      ██",
        }, "\n"),
      },
    },
  },
}
