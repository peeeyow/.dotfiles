-- Run: nvim --headless -u NONE -l ~/.config/nvim/lua/zotero_annotations/tests/import_zotero_annotations.lua
local config_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h:h:h")
vim.opt.rtp:prepend(config_dir)
vim.opt.rtp:append(vim.fn.stdpath "data" .. "/lazy/zotcite")

local annotations, selected_callback
local warnings = {}
vim.notify = function(message) table.insert(warnings, message) end
local refs = function(key, callback)
  assert(key == "", "The paper selector should open without a search filter")
  selected_callback = callback -- Selection happens after the command returns.
end
package.loaded["zotcite"] = { setup = function() end, zwarn = vim.notify }
package.loaded["zotcite.config"] = { get_config = function() return {} end }
package.loaded["zotcite.seek"] = { refs = refs }
package.loaded["zotcite.zotero"] = {
  get_annotations = function(key, offset)
    assert(key == "paper" and offset == 0)
    return annotations
  end,
}
package.loaded["zotcite.hl"] = { citations = function() end }
-- Exercise the installed Zannotations implementation, not a replacement importer.
vim.api.nvim_create_user_command(
  "Zannotations",
  function(opts) require("zotcite.get").annotations(opts.args, false) end,
  { nargs = "?" }
)
local spec = dofile(config_dir .. "/lua/plugins/zotcite.lua")
spec.config(nil, spec.opts)

local function lines(buf) return vim.api.nvim_buf_get_lines(buf, 0, -1, true) end
local function equal(actual, expected)
  assert(vim.deep_equal(actual, expected), vim.inspect { actual = actual, expected = expected })
end
local function fresh(initial)
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_set_current_buf(buf)
  vim.bo[buf].filetype = "markdown"
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, initial or { "# Paper" })
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
  selected_callback = nil
  return buf
end
local function start(data)
  annotations = data
  vim.cmd "ImportZoteroAnnotations"
  assert(require("zotcite.seek").refs == refs, "The temporary picker wrapper must be restored")
end
local function select_paper() selected_callback { value = { key = "paper" } } end

local data = {
  "First comment with [my brackets]. [comment on @paper, p. 3]",
  "",
  "> Highlight first line",
  "unprefixed continuation",
  "",
  "highlight last paragraph [@paper, p. 3]",
  "",
  "A multiline comment",
  "",
  "with another paragraph. [comment on @paper, p3]",
  "",
  "> My own quoted comment. [comment on @paper, p. 4]",
  "",
  "> Highlight without a comment. [@paper, p. 5]",
  "",
  " [comment on @paper, p. 6]", -- An empty Zotero comment.
  "",
}
local expected = { "# Paper", "", "## Annotations" }
vim.list_extend(expected, data)
vim.list_extend(expected, {
  "## Notes",
  "",
  "- First comment with [my brackets].",
  "",
  "- A multiline comment",
  "",
  "- with another paragraph.",
  "",
  "- > My own quoted comment.",
  "",
  "## Later section",
  "Keep this text.",
})
local buf = fresh { "# Paper", "## Later section", "Keep this text." }
start(data)
equal(lines(buf), { "# Paper", "", "## Annotations", "## Later section", "Keep this text." })
-- A different current buffer must never receive the selected annotations.
local pending = selected_callback
local other = fresh { "Other buffer" }
pending { value = { key = "paper" } }
equal(lines(buf), expected)
equal(lines(other), { "Other buffer" })
assert(vim.api.nvim_get_current_buf() == other)

vim.api.nvim_set_current_buf(buf)
start(data) -- Refuse to duplicate existing sections or overwrite edited Notes.
assert(selected_callback == nil) -- No new selector was opened.
equal(lines(buf), expected)

for _, heading in ipairs { "## Notes", "## Annotations" } do
  buf = fresh { "# Paper", heading, "Existing work" }
  start(data)
  assert(selected_callback == nil)
  equal(lines(buf), { "# Paper", heading, "Existing work" })
end

buf = fresh()
start(data)
selected_callback(nil) -- Cancelled selection leaves only the requested heading.
equal(lines(buf), { "# Paper", "", "## Annotations" })

for _, empty in ipairs { false, {} } do
  buf = fresh()
  start(empty or nil)
  select_paper()
  equal(lines(buf), { "# Paper", "", "## Annotations" })
end

buf = fresh()
start { "> Highlight only. [@paper, p. 1]", "" }
select_paper()
equal(lines(buf), { "# Paper", "", "## Annotations", "> Highlight only. [@paper, p. 1]", "", "## Notes", "", "" })

-- Headings stay headings; lists inside prose notes gain one indentation level.
local formatted_data = {
  "### Topic [comment on @paper, p. 1]",
  "",
  "Parent note",
  "wrapped continuation",
  "",
  "- Existing item",
  "  - Nested item",
  "    continuation of nested item",
  "",
  "+ Another item",
  "",
  "Next paragraph",
  "1. Ordered child",
  "   1) Nested ordered child",
  "",
  "#### New heading",
  "After heading [comment on @paper, p. 2]",
  "",
  "- Standalone existing list",
  "  - Preserve its nesting",
  "    wrapped continuation",
  "- [ ] Task [comment on @paper, p. 3]",
  "",
  "1. Standalone ordered list",
  "   continued text",
  "2. Second item [comment on @paper, p. 4]",
  "",
  "# Top heading [comment on @paper, p. 5]",
  "",
}
local formatted_expected = { "# Paper", "", "## Annotations" }
vim.list_extend(formatted_expected, formatted_data)
vim.list_extend(formatted_expected, {
  "## Notes",
  "",
  "### Topic",
  "",
  "- Parent note",
  "  wrapped continuation",
  "",
  "  - Existing item",
  "    - Nested item",
  "      continuation of nested item",
  "",
  "  + Another item",
  "",
  "- Next paragraph",
  "  1. Ordered child",
  "     1) Nested ordered child",
  "",
  "#### New heading",
  "- After heading",
  "",
  "- Standalone existing list",
  "  - Preserve its nesting",
  "    wrapped continuation",
  "- [ ] Task",
  "",
  "1. Standalone ordered list",
  "   continued text",
  "2. Second item",
  "",
  "# Top heading",
  "",
})
buf = fresh()
start(formatted_data)
select_paper()
equal(lines(buf), formatted_expected)

buf = fresh()
start(data)
vim.api.nvim_buf_set_lines(buf, -1, -1, true, { "Edited during selection" })
local edited = lines(buf)
select_paper()
equal(lines(buf), edited)
assert(warnings[#warnings]:find "changed during selection")

buf = fresh()
start(data)
vim.api.nvim_buf_delete(buf, { force = true })
select_paper() -- A closed note is safe to ignore.

buf = fresh()
vim.bo[buf].modifiable = false
start(data)
assert(selected_callback == nil)
equal(lines(buf), { "# Paper" })

buf = fresh()
vim.bo[buf].filetype = "tex"
start(data)
assert(selected_callback == nil)
equal(lines(buf), { "# Paper" })

buf = fresh()
vim.api.nvim_del_user_command "Zannotations"
start(data)
assert(selected_callback == nil)
equal(lines(buf), { "# Paper" })
vim.api.nvim_create_user_command("Zannotations", function() error "Selector failed" end, {})
start(data)
assert(warnings[#warnings]:find "Selector failed")

assert(vim.fn.exists ":ImportZoteroAnnotations" == 2)
print "ImportZoteroAnnotations: all checks passed"
