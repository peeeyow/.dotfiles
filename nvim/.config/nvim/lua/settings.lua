CACHE_PATH = vim.fn.stdpath "cache" 

local options = {
    -- access system wide clipboard
    clipboard = "unnamedplus",

    -- use utf-8 character encoding
    fileencoding = "utf-8",
    -- set term gui colors
    termguicolors = true,
    -- always show the sign column, otherwise it would shift the text each time
    signcolumn = "yes",
    -- wrap long lines
    wrap = true,

    -- allow `` marks to be visible in markdown files
    conceallevel = 0,
    -- allow mouse usage
    mouse = "a",

    -- completion menu don't select first item
    completeopt = { "menuone", "noselect", "noinsert" },
    -- increase neovim command line height to 2 rows
    cmdheight = 2,

    -- undo directory
    undodir = CACHE_PATH .. "/undo",
    -- set undo persistence
    undofile = true,

    -- treesitter stuff
    -- folding, set to "expr" for treesitter based folding
    foldmethod = "expr",
    -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
    foldexpr = "nvim_treesitter#foldexpr()",
    -- set pop up menu height
    pumheight = 10,


    -- allow buffers to be hidden even unsaved
    hidden = true,

    -- highlight previous search pattern
    hlsearch = true,
    -- ignore search pattern case
    ignorecase = true,
    -- ignore ignorecase when mix
    smartcase = true,

    -- tab stuff
    -- show tabs
    -- showtabline = 4,
    -- indent when previous is indented
    smartindent = true,
    -- convert tabs to spaces
    expandtab = true,
    -- spaces per indent
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    -- tab end location
    tabstop = 4,
  
    -- window spliting stuff
    -- make horz split to always go below the current window
    splitbelow = true,
    -- make vers split to always go right of the current window
    splitright = true,

    -- wait time in ms for key mapping sequence execution
    timeoutlen = 500,
    -- faster completion git signs
    updatetime = 300,

    -- numbering
    -- show numbering
    number = true,
    -- relative numbering 
    relativenumber = true,
    -- numbering width size
    numberwidth = 2,

    -- highlighting
    -- highlight current line
    cursorline = true,
    scrolloff = 8
}

-- wrap lines movement (move back/forward oneline using h/l)
vim.opt.whichwrap:append("<>[]hl")

-- don't auto comment new line
vim.api.nvim_command([[ autocmd BufNewFile,BufRead * setlocal formatoptions-=cro ]])
-- vim.opt.formatoptions:remove("cro")

vim.api.nvim_exec([[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
    augroup END
]], false)

-- remember folding
vim.opt.viewoptions:remove("options")
vim.api.nvim_exec([[
augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
    autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
augroup END
]], false)

-- add python provider
vim.api.nvim_exec( [[
    let g:python3_host_prog = expand("~/.config/nvim/provider_python/bin/python")
]], false)

-- add node provider
--[=[
vim.api.nvim_exec([[
let g:node_host_prog = expand("~/.config/nvim/provider_nodejs/bin/node")
]], false)
--]=]

for option, value in pairs(options) do 
    vim.opt[option] = value
end

-- from nvchad
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- others
