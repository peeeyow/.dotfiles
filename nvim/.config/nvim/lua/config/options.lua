local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
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
  laststatus = 3,
  fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
  },
  spelloptions = "camel",
  -- spell = true,
  autoread = true,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- wrap lines movement (move back/forward oneline using h/l)
vim.opt.whichwrap:append "<>[]hl"

-- -- remember folding
-- vim.opt.viewoptions:remove "options"
-- vim.api.nvim_exec(
--   [[
--   augroup remember_folds
--       autocmd!
--       autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
--       autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
--   augroup END
-- ]],
--   false
-- )

vim.opt.shortmess:append "c"
vim.opt.nrformats:append { "alpha", "octal", "hex" }

-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
