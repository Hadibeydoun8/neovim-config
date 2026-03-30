return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"clangd",
					"rust_analyzer",
					"omnisharp",
					"lua_ls",
				},
			}) -- <-- this was missing

			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			vim.lsp.enable({
				"ts_ls",
				"clangd",
				"rust_analyzer",
				"omnisharp",
				"lua_ls",
			})
		end,
	},
}
