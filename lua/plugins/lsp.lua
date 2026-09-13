return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"clangd",
					"rust_analyzer",
					"omnisharp",
					"lua_ls",
					"yamlls",
					"tailwindcss",
				},
			})

			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			-- Use Apple's SourceKit-LSP from the active Xcode toolchain.
			vim.lsp.config("sourcekit", {
				cmd = { "xcrun", "sourcekit-lsp" },
			})

			-- Classic ASP / VBScript
			vim.lsp.config("asp_lsp", {
				cmd = { "asp-lsp", "--stdio" },
				filetypes = { "aspvbs" },
				root_markers = { ".git" },

				on_init = function(client)
					local semantic = client.server_capabilities.semanticTokensProvider
					if semantic then
						semantic.range = false
					end
				end,
			})
			vim.lsp.enable({
				"ts_ls",
				"clangd",
				"rust_analyzer",
				"omnisharp",
				"lua_ls",
				"sourcekit",
				"asp_lsp",
				"tailwindcss",
			})
		end,
	},
}
