local ls = require "luasnip"
local i = ls.insert_node
local sn = ls.snippet_node

local M = {}

--- Create function that returns whether node type is equal to mode
---@param mode string
---@return fun():boolean
M.in_mode = function(mode)
  return function()
    local node = vim.treesitter.get_node()
    while node do
      if node:type() == mode then return true end
      node = node:parent()
    end
    return false
  end
end

M.in_comment = M.in_mode "comment"
M.in_math = M.in_mode "math"
M.in_code_block = M.in_mode "raw_blck"
M.in_code_inline = M.in_mode "raw_span"
M.in_code = function() return M.in_code_block() or M.in_code_inline() end

M.get_visual = function(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

return M
