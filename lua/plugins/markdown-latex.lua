return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-mini/mini.icons", -- or 'nvim-tree/nvim-web-devicons'
	},
	opts = {},

	{
		"michaelb/sniprun",
		build = "sh install.sh",
		opts = {},
	},
}
