-- Run: nvim --headless -u NONE -l ~/.config/nvim/lua/zotero_annotations/tests/import_zotero_annotations.lua
local config_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h:h:h")
vim.opt.rtp:prepend(config_dir)

local selected_callback, completed
local warnings, commands = {}, {}
vim.notify = function(message) table.insert(warnings, message) end
local refs = function(key, callback)
  assert(key == "", "The reference picker should open without a search filter")
  selected_callback = callback
end
package.loaded["zotcite"] = { setup = function() end }
package.loaded["zotcite.seek"] = { refs = refs }
package.loaded["zotcite.get"] = { yaml_field = function() end }
package.loaded["zotcite.zotero"] = {
  get_annotations = function() error "Zotcite must not retrieve annotations" end,
}
vim.api.nvim_create_user_command("Zseek", function() end, {})
vim.api.nvim_create_user_command("Zannotations", function() error "Zannotations must not be called" end, {})
local spec = dofile(config_dir .. "/lua/plugins/zotcite.lua")
spec.config(nil, spec.opts)

local system = vim.system
vim.system = function(argv, opts, callback)
  assert(#argv == 4 and vim.fn.executable(argv[1]) == 1)
  assert(type(argv[4]) == "string")
  assert(argv[2] == vim.fn.expand "~/obsidian/main-vault/scripts/import_zotero_annotations.py")
  assert(opts.cwd == vim.fn.expand "~/obsidian/main-vault")
  assert(opts.text and opts.timeout == 35000)
  table.insert(commands, argv)
  completed = callback
  return {}
end

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
  selected_callback, completed = nil, nil
  return buf
end
local function start()
  local before = require("zotcite.seek").refs
  vim.cmd "ImportZoteroAnnotations"
  assert(require("zotcite.seek").refs == before, "The picker must not be monkey-patched")
end
local function select_paper(citekey)
  selected_callback { value = { key = "ZOT12345", cite = citekey or "paper", title = "Paper title" } }
end
local function finish(result)
  completed(result)
  vim.wait(20, function() return false end, 1)
end
local snippet = {
  "## Annotations",
  "",
  "> [!quote]+ Highlight ([Page. 1](<zotero://open-pdf/library/items/PDF12345?annotation=TEXT1234&page=1>))",
  "> Selected text.",
  ">",
  "> - My $x$ comment.",
  "",
  "## Notes",
  "",
  "- My $x$ comment. ([Page. 1](<zotero://open-pdf/library/items/PDF12345?annotation=TEXT1234&page=1>))",
  "",
  "## Reference",
  "",
  "Zotero: @paper",
  "[Paper title](</references/paper.md>)",
  "",
}
local result = { code = 0, stdout = table.concat(snippet, "\n") .. "\n", stderr = "" }

local buf = fresh { "# Paper", "## Later section", "Keep this text." }
start()
equal(lines(buf), { "# Paper", "## Later section", "Keep this text." })
assert(completed == nil, "Opening the picker must not start retrieval")
local pending = selected_callback
local other = fresh { "Other buffer" }
pending { value = { key = "ZOT12345", cite = "paper", title = "Paper title" } }
assert(commands[#commands][3] == "paper", "Use the citation key, not Zotero's item key")
assert(commands[#commands][4] == "Paper title", "Pass the selected reference's title")
finish(result)
local expected = { "# Paper", "" }
vim.list_extend(expected, snippet)
vim.list_extend(expected, { "## Later section", "Keep this text." })
equal(lines(buf), expected)
equal(lines(other), { "Other buffer" })
assert(vim.api.nvim_get_current_buf() == other)

vim.api.nvim_set_current_buf(buf)
start()
assert(selected_callback == nil)
equal(lines(buf), expected)
for _, heading in ipairs { "## Notes", "## Annotations", "## Reference" } do
  buf = fresh { "# Paper", heading, "Existing work" }
  start()
  assert(selected_callback == nil and completed == nil)
  equal(lines(buf), { "# Paper", heading, "Existing work" })
end

buf = fresh()
start()
selected_callback(nil)
equal(lines(buf), { "# Paper" })
start() -- Cancellation does not leave a heading that prevents a retry.
select_paper()
finish { code = 0, stdout = "", stderr = "" }
equal(lines(buf), { "# Paper" })
assert(warnings[#warnings]:find "No annotations")

buf = fresh()
start()
select_paper()
finish { code = 1, stdout = "Partial output must not be inserted", stderr = "Image is not cached" }
equal(lines(buf), { "# Paper" })
assert(warnings[#warnings] == "Image is not cached")

buf = fresh()
start()
vim.api.nvim_buf_set_lines(buf, -1, -1, true, { "Edited during selection" })
local edited = lines(buf)
select_paper()
assert(completed == nil)
equal(lines(buf), edited)
assert(warnings[#warnings]:find "changed during selection or retrieval")

buf = fresh()
start()
select_paper()
vim.api.nvim_buf_set_lines(buf, -1, -1, true, { "Edited during retrieval" })
edited = lines(buf)
finish(result)
equal(lines(buf), edited)

for _, during_retrieval in ipairs { false, true } do
  buf = fresh()
  start()
  if during_retrieval then select_paper() end
  vim.api.nvim_buf_delete(buf, { force = true })
  if during_retrieval then
    finish(result)
  else
    select_paper()
  end
end

for _, option in ipairs { "modifiable", "filetype" } do
  buf = fresh()
  if option == "modifiable" then
    vim.bo[buf].modifiable = false
  else
    vim.bo[buf].filetype = "tex"
  end
  start()
  assert(selected_callback == nil and completed == nil)
  equal(lines(buf), { "# Paper" })
end
buf = fresh()
start()
select_paper()
vim.bo[buf].modifiable = false
finish(result)
equal(lines(buf), { "# Paper" })

buf = fresh()
start()
selected_callback { value = { key = "ZOT12345" } }
assert(completed == nil)
equal(lines(buf), { "# Paper" })
assert(warnings[#warnings]:find "no Better BibTeX citation key")

buf = fresh()
start()
select_paper "paper with spaces; literal argument"
assert(commands[#commands][3] == "paper with spaces; literal argument")
finish(result)
assert(lines(buf)[3] == "## Annotations")

buf = fresh()
package.loaded["zotcite.seek"].refs = function() error "Selector failed" end
start()
equal(lines(buf), { "# Paper" })
assert(warnings[#warnings]:find "Selector failed")
package.loaded["zotcite.seek"].refs = refs
start()
vim.system = function() error "Process could not start" end
select_paper()
equal(lines(buf), { "# Paper" })
assert(warnings[#warnings]:find "Process could not start")
vim.system = system

buf = fresh()
vim.api.nvim_del_user_command "Zseek"
start()
assert(selected_callback == nil)
equal(lines(buf), { "# Paper" })
assert(warnings[#warnings]:find "picker is unavailable")
assert(vim.fn.exists ":ImportZoteroAnnotations" == 2)
print "ImportZoteroAnnotations: all checks passed"
