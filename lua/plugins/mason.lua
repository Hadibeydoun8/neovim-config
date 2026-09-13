return {
	"mason-org/mason.nvim",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		registries = {
			"file:" .. vim.fn.stdpath("config") .. "/mason-registry",
			"github:mason-org/mason-registry",
		},
	},
}
