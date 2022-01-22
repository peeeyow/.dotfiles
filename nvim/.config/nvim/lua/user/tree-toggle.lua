local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
  return
end
local nvim_tree_view = require "nvim-tree.view"

-- local barbar_status_ok, bufferline_state = pcall(require, "bufferline.state")
-- if not barbar_status_ok then
--   return
-- end

local tree ={}
tree.toggle = function ()
  if nvim_tree_view.win_open() then
    -- bufferline_state.set_offset(0)
    nvim_tree.close()
  else
    -- bufferline_state.set_offset(nvim_tree_view.View.width + 1, "NvimTree")
    if vim.api.nvim_buf_get_name(0) == '' then
      nvim_tree.open()
    else
      nvim_tree.find_file(true)
    end
  end
end

return tree
