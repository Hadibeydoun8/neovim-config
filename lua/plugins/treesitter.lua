local parsers = {
	"lua",
	"bash",
	"c",
	"css",
	"rust",
	"cpp",
	"c_sharp",
	"tsx",
	"typescript",
	"javascript",
	"vim",
	"vimdoc",
	"html",
	"json",
	"python",
	"r",
	"csv",
	"markdown",
	"markdown_inline",
	"toml",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			opts = {
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			},
		},
	},
	config = function()
		local treesitter = require("nvim-treesitter")

		-- `main` is an incompatible rewrite: parser installation and features
		-- are configured separately instead of through `configs.setup()`.
		treesitter.install(parsers):wait(30000)

		local enabled = {}
		for _, language in ipairs(parsers) do
			enabled[language] = true
		end

		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable Tree-sitter highlighting and indentation",
			callback = function(event)
				local language = vim.treesitter.language.get_lang(event.match) or event.match
				if not enabled[language] then
					return
				end

				if not pcall(vim.treesitter.start, event.buf, language) then
					return
				end

				local ok, query = pcall(vim.treesitter.query.get, language, "indents")
				if ok and query then
					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
