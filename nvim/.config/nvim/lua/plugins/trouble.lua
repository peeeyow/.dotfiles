local prefix = "<Leader>x"

---@type LazySpec
return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  keys = {
    {
      "[x",
      function()
        if require("trouble").is_open() then
          require("trouble").prev { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      desc = "Previous Trouble/Quickfix Item",
    },
    {
      "]x",
      function()
        if require("trouble").is_open() then
          require("trouble").next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      desc = "Next Trouble/Quickfix Item",
    },
    { prefix .. "t", "<Cmd>Trouble todo toggle<CR>", desc = "Todo (Trouble)" },
    { prefix .. "r", "<Cmd>Trouble lsp_references toggle<CR>", desc = "LSP References (Trouble)" },
    { prefix .. "d", "<Cmd>Trouble lsp_references toggle<CR>", desc = "LSP References (Trouble)" },
  },
}
