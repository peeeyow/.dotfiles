local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menu", "menuone", "noselect", "noinsert" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 2,
  signcolumn = "yes",
  wrap = true,
  scrolloff = 8,
  guifont = "monospace:h17",
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- wrap lines movement (move back/forward oneline using h/l)
vim.opt.whichwrap:append "<>[]hl"

-- remember folding
vim.opt.viewoptions:remove "options"
vim.api.nvim_exec(
  [[
  augroup remember_folds
      autocmd!
      autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
      autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
  augroup END
]],
  false
)

vim.opt.shortmess:append "c"

-- vim.opt.listchars = { lead = "·" }

-- don't auto comment new line
--[=[
vim.api.nvim_exec([[
  augroup no_auto_comment
      autocmd!
      au BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
]], false)
--]=]
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- highlight when yanking
vim.api.nvim_exec(
  [[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
    augroup END
]],
  false
)
-- -- add node provider
-- --[=[
-- vim.api.nvim_exec([[
-- let g:node_host_prog = expand("~/.config/nvim/provider_nodejs/bin/node")
-- ]], false)
-- --]=]

-- for option, value in pairs(options) do
--     vim.opt[option] = value
-- end

-- -- from nvchad
-- local disabled_built_ins = {
--     "netrw",
--     "netrwPlugin",
--     "netrwSettings",
--     "netrwFileHandlers",
--     "gzip",
--     "zip",
--     "zipPlugin",
--     "tar",
--     "tarPlugin",
--     "getscript",
--     "getscriptPlugin",
--     "vimball",
--     "vimballPlugin",
--     "2html_plugin",
--     "logipat",
--     "rrhelper",
--     "spellfile_plugin",
--     "matchit"
-- }

-- for _, plugin in pairs(disabled_built_ins) do
--     vim.g["loaded_" .. plugin] = 1
-- end

-- -- others
