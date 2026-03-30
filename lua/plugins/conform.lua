return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
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
