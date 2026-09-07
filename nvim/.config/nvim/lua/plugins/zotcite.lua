---@type LazySpec
return {
  "jalvesaq/zotcite",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    key_type = "better-bibtex",
    hook = {
      bib_ref = function(e)
        e.zotero_added = e.added
        return e
      end,
    },
  },
  config = function(_, opts)
    require("zotcite").setup(opts)

    -- HACK: Monkey Patch zotcite yaml field getter.
    -- This makes zotcite.get.yaml_field to return default
    -- obsidian vault bib file if buffer is inside the vault.
    local vault = vim.fn.expand "~/obsidian/main-vault/"
    local bibliography = vault .. "references/zotcite.bib"
    local get = require "zotcite.get"
    local yaml_field = get.yaml_field
    get.yaml_field = function(field, bufnr)
      local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":p")
      if field == "bibliography" and vim.bo[bufnr].filetype == "markdown" and vim.startswith(path, vault) then
        return bibliography
      end
      return yaml_field(field, bufnr)
    end
  end,
}
