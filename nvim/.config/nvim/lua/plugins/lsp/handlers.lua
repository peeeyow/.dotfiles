local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

local function lsp_navic(client, bufnr)
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

local function lsp_keymaps(bufnr)
  local km = require "config.keymaps"
  local map = km.map
  local describe_keymap = km.describe_keymap

  map("n", "K", function()
    vim.lsp.buf.hover()
  end, describe_keymap "Show Hover (LSP)")
  map("n", "gD", function()
    vim.lsp.buf.declaration()
  end, describe_keymap "Goto declaration")
  map("n", "gd", function()
    vim.lsp.buf.definition()
  end, describe_keymap "Goto definition")
  map("n", "gI", function()
    vim.lsp.buf.implementation()
  end, describe_keymap "Goto implementation")
  map("n", "gs", function()
    vim.lsp.buf.signature_help()
  end, describe_keymap "Show signature")
  map("n", "gr", function()
    vim.lsp.buf.references()
  end, describe_keymap "Goto references")
  map("n", "[d", function()
    vim.diagnostic.goto_prev { border = "rounded" }
  end, describe_keymap "Goto prev diagnostics")
  map("n", "]d", function()
    vim.diagnostic.goto_next { border = "rounded" }
  end, describe_keymap "Goto next diagnostics")
  map("n", "gl", function()
    vim.diagnostic.open_float { border = "rounded" }
  end, describe_keymap "Show diagnostics")
  map("n", "gR", "<cmd>Trouble lsp_references<cr>", describe_keymap "Show references trouble")
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.format = function(bufnr)
  local ft = vim.bo[bufnr].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format {
    bufnr = bufnr,
    filter = function(client)
      if have_nls then
        return client.name == "null-ls"
      end
      return client.name ~= "null-ls"
    end,
  }
end

local function lsp_format(client, bufnr)
  if not client.supports_method "textDocument/formatting" then
    return
  end

  vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      M.format(bufnr)
    end,
  })
end

M.lsp_highlight_document = lsp_highlight_document
M.lsp_navic = lsp_navic
M.lsp_keymaps = lsp_keymaps
M.lsp_format = lsp_format

M.on_attach = function(client, bufnr)
  lsp_format(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
  lsp_navic(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- WARN: highly experimental
-- NOTE: https://github.com/neovim/neovim/pull/22405
local workspace = {
  didChangeWatchedFiles = {
    dynamicRegistration = true,
  },
}
capabilities = vim.tbl_deep_extend("force", capabilities, { workspace = workspace })

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
