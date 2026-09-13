return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {

		format_on_save = function(bufnr)
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
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascript = { "prettier" },
			cpp = { "clang_format" },
			rust = { "rustfmt" },
			cs = { "csharpier" },
			lua = { "stylua" },
		},
	},
}
