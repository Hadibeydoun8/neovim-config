-- lua/plugins/snacks.lua
return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		bigfile = { enabled = true }, -- auto-disable LSP/treesitter on huge files
		notifier = { enabled = true }, -- better vim.notify
		terminal = { enabled = true }, -- toggle terminal
		lazygit = { enabled = true }, -- lazygit integration
		scratch = { enabled = true }, -- quick scratch buffers
		-- leave these off since you already have plugins for them:
		dashboard = { enabled = false },
		indent = { enabled = false },
		explorer = { enabled = false },
		picker = { enabled = false },
	},
	keys = {
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
