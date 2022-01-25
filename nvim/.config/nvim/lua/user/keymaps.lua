local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  -- extend options with opts having higher priority on conflict
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- empty opts
local opts = {}

-- set leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal Visual Select Operator-Pending Mode
-- easy window movement
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
map("x", "p", '"_dP', opts)

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

-- Terminal Mode --
-- better terminal navigation
-- map("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
-- map("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
-- map("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
-- map("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

-- Plugins --

-- Comment
-- map("n", "<C-_>", '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$')
-- map("x", "<C-_>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
-- map('n', [[<C-'>]], '<CMD>lua require("Comment.api").call("toggle_current_blockwise_op")<CR>g@$')
-- map('x', [[<C-'>]], '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>')
