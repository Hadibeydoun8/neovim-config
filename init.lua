vim.g.mapleader = " "

vim.g.maplocalleader = "\\"
require("config.options") -- load options before lazy
require("config.keymaps") -- load keymaps

require("config.lazy")
