vim.opt.undofile = true -- enable persistent undo
vim.opt.undolevels = 10000 -- how many changes

local opt = vim.opt

-- Indentation
opt.tabstop = 4 -- 4 spaces per tab
opt.shiftwidth = 4 -- indent size
opt.expandtab = true -- spaces instead of tabs
opt.smartindent = true

-- UI
opt.number = true -- line numbers
opt.relativenumber = true -- relative line numbers (great for jumping)
opt.signcolumn = "yes" -- always show sign column (stops layout shifting)
opt.cursorline = true -- highlight current line
opt.scrolloff = 8 -- keep 8 lines above/below cursor
opt.wrap = false -- no line wrapping

-- Search
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- unless you type uppercase

-- Splits
opt.splitright = true -- new vertical splits go right
opt.splitbelow = true -- new horizontal splits go below

opt.scrolloff = 10
