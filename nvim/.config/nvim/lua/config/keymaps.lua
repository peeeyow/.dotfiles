local opts = { noremap = true, silent = true }
local merge = function(...)
  return vim.tbl_deep_extend("force", ...)
end
local describe_keymap = function(desc)
  return merge(opts, { desc = desc })
end
local map = vim.keymap.set

local M = {}
M.opts = opts
M.merge = merge
M.describe_keymap = describe_keymap
M.map = map

-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Visual Select Operator-Pending Mode
-- easy window movement

map("", "<C-h>", "<C-w>h", describe_keymap "Move to left window")
map("", "<C-j>", "<C-w>j", describe_keymap "Move to down window")
map("", "<C-k>", "<C-w>k", describe_keymap "Move to up window")
map("", "<C-l>", "<C-w>l", describe_keymap "Move to right window")

-- easy window resize
map("", "<C-Up>", ":resize -2<CR>", describe_keymap "Resize up")
map("", "<C-Down>", ":resize +2<CR>", describe_keymap "Resize down")
map("", "<C-Left>", ":vertical resize -2<CR>", describe_keymap "Resize left")
map("", "<C-Right>", ":vertical resize +2<CR>", describe_keymap "Resize right")

-- Normal Mode --
-- center line when navigating
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
-- bring back cursor to original when joining line
map("n", "J", "mzJ`z", opts)

-- Visual Select Mode --
-- better indentation
map("v", "<", "<gv", describe_keymap "Tab to left")
map("v", ">", ">gv", describe_keymap "Tab to right")
map("v", "<M-j>", ":m '>+1<CR>gv-gv", describe_keymap "Move line one step below")
map("v", "<M-k>", ":m '<-2<CR>gv-gv", describe_keymap "Move line one step above")

-- Visual Mode --
-- make wrap text movement better when wrap is true
map("x", "j", 'v:count ? "j" : "gj"', { expr = true })
map("x", "k", 'v:count ? "k" : "gk"', { expr = true })

-- don't copy what is being overwritten
map("x", "p", [[p:let @+=@0<CR>]], opts)

-- remove search highlights
map("n", "<Leader>h", ":noh<CR>", describe_keymap "Remove highlight")

-- make wrap text movement better when wrap is true
map("n", "j", 'v:count ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count ? "k" : "gk"', { expr = true })

-- move line
map("n", "<M-j>", ":m .+1<CR>==", describe_keymap "Move line one step below")
map("n", "<M-k>", ":m .-2<CR>==", describe_keymap "Move line one step above")

-- close current buffer
map("n", "<leader>c", ":bp<bar>sp<bar>bn<bar>bd<CR>", describe_keymap "Close buffer")

-- reload current file
map("", "<F5>", "<CMD>checktime<CR>", describe_keymap "Reload file")

-- c++ stuff
map("", "<F8>", "<CMD>vs | e in.txt | sp | e out.txt<CR>", describe_keymap "Set working space")
map("", "<F9>", "<CMD>!./main<CR>", describe_keymap "run compiled solution")
map(
  "",
  "<F10>",
  "<CMD>w<CR> <CMD>!g++ -fsanitize=address -Wall -Wextra -Wshadow -pedantic-errors -std=c++20 -DONPC -O2 -o main % && ./main <CR>",
  describe_keymap "Compile and run"
)

-- don't copy empty lines
local function delete_empty()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return [["_dd]]
  else
    return "dd"
  end
end

map("n", "dd", delete_empty, { expr = true })

return M
