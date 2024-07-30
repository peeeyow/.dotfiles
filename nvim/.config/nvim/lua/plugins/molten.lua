---@type LazySpec
return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  lazy = false,
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  cmd = { "MoltenInfo", "MoltenInit" },
  keys = {
    { "<Leader>mi", ":MoltenInit<cr>", desc = "[m]olten [i]nit" },
    { "<Leader>ml", ":MoltenEvaluateLine<CR>", desc = "Molten Evaluate Line" },
    { "<Leader>mh", ":MoltenHideOutput<CR>", desc = "Molten Hide Output" },
    { "<Leader>mo", ":noautocmd MoltenEnterOutput<CR>", desc = "Molten Enter Output" },
    {
      "<Leader>mv",
      ":<C-u>MoltenEvaluateVisual<cr>",
      mode = "v",
      desc = "molten eval visual",
    },
    { "<Leader>mr", ":MoltenReevaluateCell<cr>", desc = "molten re-eval cell" },
  },
  init = function()
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_virt_text_max_lines = 1
  end,
}
