-- 1. Always enable the system clipboard for local work
-- vim.opt.clipboard = "unnamedplus"

-- 2. Only override with OSC52 if you are actually on an SSH connection
if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
	vim.g.clipboard = {
		name = "osc52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
	}
end
