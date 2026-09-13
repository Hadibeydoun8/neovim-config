return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			integrations = {
				lspconfig = false,
			},
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				"snacks.nvim",
			},
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
}
