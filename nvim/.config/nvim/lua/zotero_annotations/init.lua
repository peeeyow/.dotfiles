local M = {}

-- ponytail: prose/headings/lists only; use a Markdown parser if fenced blocks need formatting.
local function list_block(block)
  local formatted = {}
  local parent, continuing, list_indent = false, false, nil
  for _, line in ipairs(block) do
    if not line:find "%S" then
      table.insert(formatted, "")
      continuing = false
    elseif line:match "^#" then
      table.insert(formatted, line)
      parent, continuing, list_indent = false, false, nil
    elseif line:match "^%s*[-+*]%s+" or line:match "^%s*%d+[.)]%s+" then
      list_indent = parent and "  " or ""
      table.insert(formatted, list_indent .. line)
      continuing = true
    elseif list_indent and (continuing or line:match "^%s") then
      table.insert(formatted, list_indent .. line)
      continuing = true
    elseif continuing then
      table.insert(formatted, "  " .. line)
    else
      table.insert(formatted, "- " .. line)
      parent, continuing, list_indent = true, true, nil
    end
  end
  return formatted
end

-- Zotcite's citation suffix ends each record, including multiline highlights.
local function annotation_notes(lines)
  local notes, block = {}, {}
  for _, line in ipairs(lines) do
    local text, is_comment = line:gsub("%s*%[comment on @[^%]]+%]%s*$", "")
    table.insert(block, text)
    if is_comment > 0 or line:match "%[@[^%]]+%]%s*$" then
      if is_comment > 0 then
        while #block > 0 and not block[1]:find "%S" do
          table.remove(block, 1)
        end
        while #block > 0 and not block[#block]:find "%S" do
          table.remove(block)
        end
        if #notes > 0 and #block > 0 then table.insert(notes, "") end
        vim.list_extend(notes, list_block(block))
      end
      block = {}
    end
  end
  return notes
end

local function import_annotations()
  local buf = vim.api.nvim_get_current_buf()
  if vim.bo[buf].filetype ~= "markdown" or not vim.bo[buf].modifiable then
    vim.notify("Open an editable Markdown note first.", vim.log.levels.WARN)
    return
  end
  if vim.fn.exists ":Zannotations" == 0 then
    vim.notify("Zannotations is unavailable; check Zotcite initialization.", vim.log.levels.ERROR)
    return
  end
  for _, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
    if line:match "^##%s+Annotations%s*$" or line:match "^##%s+Notes%s*$" then
      vim.notify("Annotations or Notes already exists; leaving the note unchanged.", vim.log.levels.WARN)
      return
    end
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(buf, row, row, true, { "", "## Annotations" })
  local heading = row + 2
  vim.api.nvim_win_set_cursor(0, { heading, 0 })
  local tick = vim.api.nvim_buf_get_changedtick(buf)

  -- Wrap only this picker callback, then restore Zotcite before selection.
  local seek = require "zotcite.seek"
  local refs = seek.refs
  seek.refs = function(key, callback)
    return refs(key, function(selection)
      if not selection then return end
      if not vim.api.nvim_buf_is_loaded(buf) then return end
      if vim.api.nvim_buf_get_changedtick(buf) ~= tick or not vim.bo[buf].modifiable then
        vim.notify("The note changed during selection; import cancelled.", vim.log.levels.WARN)
        return
      end
      vim.api.nvim_buf_call(buf, function()
        vim.api.nvim_win_set_cursor(0, { heading, 0 })
        local before = vim.api.nvim_buf_line_count(buf)
        callback(selection) -- Zannotations inserts its original output here.
        local added = vim.api.nvim_buf_line_count(buf) - before
        if added == 0 then return end
        local annotations = vim.api.nvim_buf_get_lines(buf, heading, heading + added, true)
        local notes = { "## Notes", "" }
        if annotations[#annotations] ~= "" then table.insert(notes, 1, "") end
        vim.list_extend(notes, annotation_notes(annotations))
        table.insert(notes, "")
        vim.api.nvim_buf_set_lines(buf, heading + added, heading + added, true, notes)
      end)
    end)
  end
  local ok, err = pcall(vim.cmd, "Zannotations")
  seek.refs = refs
  if not ok then vim.notify(tostring(err), vim.log.levels.ERROR) end
end

function M.setup()
  vim.api.nvim_create_user_command(
    "ImportZoteroAnnotations",
    import_annotations,
    { desc = "Import Zotero annotations and create comment-only bullet Notes" }
  )
end

return M
