return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {

		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			if ft == "cs" then
				return {
					timeout_ms = 5000,
					lsp_format = "never",
				}
			end

			if ft == "tex" or ft == "plaintex" then
				return {
					timeout_ms = 3000,
					lsp_format = "never",
				}
			end

			if vim.bo[bufnr].filetype == "aspvbs" then
				return {
					timeout_ms = 500,
					lsp_format = "never",
				}
			end

			return {
				timeout_ms = 500,
				lsp_format = "fallback",
			}
		end,

		formatters_by_ft = {
			cs = { "csharpier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascript = { "prettier" },
			cpp = { "clang_format" },
			rust = { "rustfmt" },
			lua = { "stylua" },
			tex = { "latexindent" },
			plaintex = { "latexindent" },
		},
		formatters = {
			csharpier = {
				command = vim.fn.expand("~/.dotnet/tools/csharpier"),
				args = { "format", "--stdin-path", "$FILENAME" },
			},
			latexindent = {
				command = "/opt/homebrew/bin/latexindent",
			},
		},
	},
}
