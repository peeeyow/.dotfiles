local VAULT_ROOT = vim.fn.expand "~/obsidian/main-vault"
local IMPORT_SCRIPT = VAULT_ROOT .. "/scripts/import_zotero_annotations.py"
local VENV_PYTHON = VAULT_ROOT .. "/.venv/bin/python"
local PYTHON = vim.fn.executable(VENV_PYTHON) == 1 and VENV_PYTHON or vim.fn.exepath "python3"

local M = {}

local function import_annotations()
  local buf = vim.api.nvim_get_current_buf()
  if vim.bo[buf].filetype ~= "markdown" or not vim.bo[buf].modifiable then
    vim.notify("Open an editable Markdown note first.", vim.log.levels.WARN)
    return
  end
  if vim.fn.exists ":Zseek" == 0 then
    vim.notify("The Zotcite picker is unavailable; check Zotcite initialization.", vim.log.levels.ERROR)
    return
  end
  for _, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
    if line:match "^##%s+Annotations%s*$" or line:match "^##%s+Notes%s*$" or line:match "^##%s+Reference%s*$" then
      vim.notify("Annotations, Notes or Reference already exists; leaving the note unchanged.", vim.log.levels.WARN)
      return
    end
  end

  if PYTHON == "" or vim.fn.filereadable(IMPORT_SCRIPT) == 0 then
    vim.notify("The Python annotation importer is unavailable: " .. IMPORT_SCRIPT, vim.log.levels.ERROR)
    return
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]
  local tick = vim.api.nvim_buf_get_changedtick(buf)
  local function unchanged()
    if not vim.api.nvim_buf_is_loaded(buf) then return false end
    if
      vim.api.nvim_buf_get_changedtick(buf) ~= tick
      or not vim.bo[buf].modifiable
      or vim.bo[buf].filetype ~= "markdown"
    then
      vim.notify("The note changed during selection or retrieval; import cancelled.", vim.log.levels.WARN)
      return false
    end
    return true
  end

  local ok, err = pcall(function()
    require("zotcite.seek").refs("", function(selection)
      if not selection or not unchanged() then return end
      local citekey = selection.value and selection.value.cite
      if type(citekey) ~= "string" or not citekey:find "%S" then
        vim.notify("The selected reference has no Better BibTeX citation key.", vim.log.levels.ERROR)
        return
      end
      local started, failure = pcall(vim.system, { PYTHON, IMPORT_SCRIPT, citekey, selection.value.title or citekey }, {
        cwd = VAULT_ROOT,
        text = true,
        timeout = 35000,
      }, function(result)
        vim.schedule(function()
          if not unchanged() then return end
          if result.code ~= 0 then
            local message = vim.trim(result.stderr or "")
            vim.notify(message ~= "" and message or "Zotero annotation retrieval failed.", vim.log.levels.ERROR)
            return
          end
          if not result.stdout or not result.stdout:find "%S" then
            vim.notify("No annotations found; leaving the note unchanged.", vim.log.levels.INFO)
            return
          end
          local lines = vim.split(result.stdout, "\n", { plain = true })
          if lines[#lines] == "" then table.remove(lines) end
          table.insert(lines, 1, "")
          vim.api.nvim_buf_set_lines(buf, row, row, true, lines)
        end)
      end)
      if not started then vim.notify(tostring(failure), vim.log.levels.ERROR) end
    end)
  end)
  if not ok then vim.notify(tostring(err), vim.log.levels.ERROR) end
end

function M.setup()
  vim.api.nvim_create_user_command(
    "ImportZoteroAnnotations",
    import_annotations,
    { desc = "Import Zotero annotation callouts, linked Notes and Reference" }
  )
end

return M
