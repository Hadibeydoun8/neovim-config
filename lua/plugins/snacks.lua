-- lua/plugins/snacks.lua
-- lua/plugins/snacks.lua
return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,

	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		notifier = { enabled = true },
		terminal = { enabled = true },
		lazygit = { enabled = true },
		scratch = { enabled = true },

		dashboard = { enabled = false },
		indent = { enabled = false },
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		picker = {
			enabled = true,

			sources = {
				explorer = {
					actions = {
						open_zathura = function(_, item)
							if not item or item.dir or not item.file then
								return
							end

							if not item.file:lower():match("%.pdf$") then
								Snacks.notify.warn("Selected file is not a PDF")
								return
							end

							vim.fn.jobstart({
								"zathura",
								vim.fn.fnamemodify(item.file, ":p"),
							}, {
								detach = true,
							})
						end,
					},

					win = {
						list = {
							keys = {
								["O"] = "open_zathura",
							},
						},
					},
				},
			},
		},
	},

	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Scratch Buffer",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss Notifications",
		},
	},
}
