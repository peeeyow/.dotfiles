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
-- make wrap text movement better when wrap is true
map("", "j", 'v:count ? "j" : "gj"', {expr = true})
map("", "k", 'v:count ? "k" : "gk"', {expr = true})
map("", "<Down>", 'v:count ? "j" : "gj"', {expr = true})
map("", "<Up>", 'v:count ? "k" : "gk"', {expr = true})

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

-- Visual Mode --
-- better indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- don't copy what was replaced
map("v", "p", '"_dP', opts)

-- Normal Mode --
-- move through buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- remove search highlights
map("n", "<Leader>h", ":noh<CR>", opts)

-- Terminal Mode --
-- better terminal navigation
map("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- Plugins --
-- NvimTree
-- map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<Leader>e", ":Lex 30<CR>", opts)


-- compe mappings
-- map("i", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true })
-- map("i", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true })
-- map("i", "<C-Space>", "compe#complete()", { expr = true })
