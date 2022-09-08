local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.blockwise then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.linewise and "__default" or "__multiline",
      location = location,
    }
  end,
  padding = true,
  ignore = "^$",
  mappings = {
    basic = true,
    extra = false,
  },
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  post_hook = nil,
}

local ft = require "Comment.ft"

ft.set("python", { "#%s", [["""%s"""]] })

--[[
This can't be used to comment out top level jsx. It will revert back to js commenting.
https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/29
]]
