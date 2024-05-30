---@type LazySpec
return {
  "andymass/vim-matchup",
  lazy = false,
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup", fullwidth = 1, highlight = "Normal", syntax_hl = 1 }
  end,
}
