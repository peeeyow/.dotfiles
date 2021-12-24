local options = {
    -- creates a backup file
    backup = false,
    -- allows neovim to access the system clipboard
    clipboard = "unnamedplus",
    -- more space in the neovim command line for displaying messages
    cmdheight = 2,
    -- mostly just for cmp
    completeopt = { "menuone","noselect" },
    -- so that `` is visible in markdown files
    conceallevel = 0,
    -- the encoding written to a file
    fileencoding = "utf-8",
    -- highlight all matches on previous search pattern
    hlsearch = true,
    -- ignore case in search patterns
    ignorecase = true,
     -- allow the mouse to be used in neovim
    mouse = "a",
    -- pop up menu height
    pumheight = 10,
    -- we don't need to see things like -- INSERT -- anymore
    showmode = false,
    -- always show tabs
    showtabline = 2,
    -- smart case
    smartcase = true,
    -- make indenting smarter again
    smartindent = true,
    -- force all horizontal splits to go below current window
    splitbelow = true,
    -- force all vertical splits to go to the right of current window
    splitright = true,
    -- creates a swapfile
    swapfile = false,
    -- set term gui colors (most terminals support this)
    -- termguicolors = true,
    -- time to wait for a mapped sequence to complete (in milliseconds)
    timeoutlen = 1000,
    -- enable persistent undo
    undofile = true,
    -- faster completion (4000ms default)
    updatetime = 300,
    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    writebackup = false,
    -- convert tabs to spaces
    expandtab = true,
    -- the number of spaces inserted for each indentation
    shiftwidth = 4,
     -- insert 2 spaces for a tab
    tabstop = 4,
    -- highlight the current line
    cursorline = true,
    -- set numbered lines
    number = true,
    -- set relative numbered lines
    relativenumber = true,
    -- set number column width to 2 {default 4}
    numberwidth = 4,
    -- always show the sign column, otherwise it would shift the text each time
    signcolumn = "yes",
    -- display lines as one long line
    wrap = true,
    -- is one of my fav
    scrolloff = 4,

    sidescrolloff = 8,
    -- the font used in graphical neovim applications
    guifont = "monospace:h17",
}

for option, value in pairs(options) do
  vim.opt[option] = value
end


-- wrap lines movement (move back/forward oneline using h/l)
vim.opt.whichwrap:append "<>[]hl"

-- remember folding
vim.opt.viewoptions:remove "options"
vim.api.nvim_exec([[
  augroup remember_folds
      autocmd!
      autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
      autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
  augroup END
]], false)

vim.opt.shortmess:append "c"

-- -- don't auto comment new line
vim.api.nvim_command([[ autocmd BufNewFile,BufRead * setlocal formatoptions-=cro ]])
-- vim.opt.formatoptions:remove("cro")

-- highlight when yanking
vim.api.nvim_exec([[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
    augroup END
]], false)


-- CACHE_PATH = vim.fn.stdpath "cache"
-- -- add python provider
-- vim.api.nvim_exec( [[
--     let g:python3_host_prog = expand("~/.config/nvim/provider_python/bin/python")
-- ]], false)

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
