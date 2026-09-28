return {
	{
		-- FIX: Corrected organization name from 'mason-org' to 'williamboman'
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason-lspconfig").setup({
				-- FIX: Changed automatic_enable to automatic_installation
				automatic_installation = true,
				ensure_installed = {
					"ts_ls",
					"clangd",
					"rust_analyzer",
					"roslyn_ls",
					"lua_ls",
					"yamlls",
					"tailwindcss",
					"eslint",
				},
			})

			-- Set global capabilities for blink.cmp
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			-- Use Apple's SourceKit-LSP from the active Xcode toolchain.
			vim.lsp.config("sourcekit", {
				cmd = { "xcrun", "sourcekit-lsp" },
				filetypes = { "swift" },
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

			-- Enable all configured language servers
			vim.lsp.enable({
				"ts_ls",
				"clangd",
				"rust_analyzer",
				"roslyn_ls",
				"lua_ls",
				"yamlls", -- Added yamlls here since it was in ensure_installed
				"sourcekit",
				"asp_lsp",
				"tailwindcss",
				"eslint",
			})
		end,
	},
}
