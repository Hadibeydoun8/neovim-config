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
opt.scrolloff = 16 -- keep 8 lines above/below cursor

-- Wrap
opt.wrap = true -- no line wrapping
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↳ "

-- Spell Check
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }

-- Search
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- unless you type uppercase

-- Splits
opt.splitright = true -- new vertical splits go right
opt.splitbelow = true -- new horizontal splits go below

opt.scrolloff = 10

vim.o.confirm = true
vim.o.showmode = false
vim.o.inccommand = "split"

-- diagnostic
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	-- underline = { severity = { min = vim.diagnostic.severity.WARN } },

	underline = true,

	jump = {
		on_jump = function(_, bufnr)
			vim.diagnostic.open_float({
				bufnr = bufnr,
				scope = "cursor",
				focus = false,
			})
		end,
	},
})
