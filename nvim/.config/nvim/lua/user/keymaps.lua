-- local function map(mode, lhs, rhs, opts)
--   local options = { noremap = true, silent = true }
--   -- extend options with opts having higher priority on conflict
--   if opts then
--     options = vim.tbl_extend("force", options, opts)
--   end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end

-- empty opts
local opts = { noremap = true, silent = true }

-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Visual Select Operator-Pending Mode
-- easy window movement

local map = vim.keymap.set

map("", "<C-h>", "<C-w>h", opts)
map("", "<C-j>", "<C-w>j", opts)
map("", "<C-k>", "<C-w>k", opts)
map("", "<C-l>", "<C-w>l", opts)

-- easy window resize
map("", "<C-Up>", ":resize -2<CR>", opts)
map("", "<C-Down>", ":resize +2<CR>", opts)
map("", "<C-Left>", ":vertical resize -2<CR>", opts)
map("", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual Select Mode --
-- better indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)

-- Visual Mode --
-- make wrap text movement better when wrap is true
map("x", "j", 'v:count ? "j" : "gj"', { expr = true })
map("x", "k", 'v:count ? "k" : "gk"', { expr = true })

-- don't copy what is being overwritten
map("x", "p", [[p:let @+=@0<CR>]], opts)

-- Normal Mode --
-- move through buffers
-- map("n", "[b", ":bnext<CR>", opts)
-- map("n", "]b", ":bprevious<CR>", opts)

-- remove search highlights
map("n", "<Leader>h", ":noh<CR>", opts)

-- make wrap text movement better when wrap is true
map("n", "j", 'v:count ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count ? "k" : "gk"', { expr = true })

-- move line
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- close current buffer
map("n", "<Leader>c", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)

-- don't copy empty lines
local function delete_empty()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return [["_dd]]
  else
    return "dd"
  end
end

map("n", "dd", delete_empty, { expr = true })

-- Plugins --

-- navigate hunks
map("", "]c", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[Gitsigns next_hunk]]
  end
end, opts)
map("", "[c", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[Gitsigns prev_hunk]]
  end
end, opts)

-- navigate trouble items
map("", "[t", function()
  require("trouble").previous { skip_groups = true, jump = true }
end, opts)
map("", "]t", function()
  require("trouble").next { skip_groups = true, jump = true }
end, opts)
