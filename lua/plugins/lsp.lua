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
				automatic_enable = {
					exclude = { "omnisharp" },
				},
				ensure_installed = {
					"ts_ls",
					"basedpyright",
					"ruff",
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

			-- Python: basedpyright for types/completion, ruff for lint + format.
			-- uv puts its environment in <project>/.venv, so hand that interpreter
			-- to basedpyright or it resolves imports against the system Python.
			vim.lsp.config("basedpyright", {
				before_init = function(_, config)
					local venv = (config.root_dir or vim.fn.getcwd()) .. "/.venv"
					local python = venv .. "/bin/python"
					if vim.uv.fs_stat(python) then
						config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
							python = { pythonPath = python },
						})
					end
				end,
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,
							diagnosticSeverityOverrides = {
								-- ruff already reports these; don't say it twice.
								reportUnusedImport = "none",
								reportUnusedVariable = "none",
								reportMissingTypeStubs = "none",
							},
						},
					},
				},
			})

			vim.lsp.config("ruff", {
				on_attach = function(client)
					-- basedpyright owns hover for Python.
					client.server_capabilities.hoverProvider = false
				end,
			})

			-- Enable all configured language servers
			vim.lsp.enable({
				"ts_ls",
				"basedpyright",
				"ruff",
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
