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
vim.g.mapleader = " "


-- make wrap text movement better
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

-- move current line up or down
-- map("x", "<M-Up>", ":m .+1<CR>gv-gv", opts)
-- map("x", "<M-Down>", ":m .-2<CR>gv-gv", opts)

-- better indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- move through buffers
map("n", "<TAB>", ":bnext<CR>", opts)
map("n", "<S-TAB>", ":bprevious<CR>", opts)

-- remove search highlights
map("n", "<Leader>h", ":noh<CR>", opts)

-- NvimTree
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)


-- compe mappings
map("i", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true })
map("i", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true })
map("i", "<C-Space>", "compe#complete()", { expr = true })
