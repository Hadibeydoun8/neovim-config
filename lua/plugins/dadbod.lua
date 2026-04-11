return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
			{ "<leader>da", "<cmd>DBUIAddConnection<cr>", desc = "Add DB connection" },
			{ "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB buffer" },
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_show_database_icon = true
			vim.g.db_ui_use_nvim_notify = true

			-- Don't auto-execute queries on save (same as JetBrains — you run manually)
			vim.g.db_ui_execute_on_save = false

			-- Per-project connections via .env or .lazy.lua
			-- Option 1: Create a .lazy.lua in your project root:
			--   vim.g.dbs = {
			--     { name = "dev",     url = "sqlserver://user:pass@localhost:1433/mydb" },
			--     { name = "staging", url = "postgresql://user:pass@localhost:5432/staging" },
			--   }
			--   return {}
			--
			-- Option 2: Use environment variable
			--   vim.g.dbs = {
			--     { name = "dev", url = "$DATABASE_URL" },
			--   }
			--
			-- Connection string formats:
			--   SQL Server:  sqlserver://user:pass@host:1433/database
			--   PostgreSQL:  postgresql://user:pass@host:5432/database
			--   SQLite:      sqlite:path/to/db.sqlite

			-- Wire up dadbod-completion to nvim-cmp for SQL buffers
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "sql", "mysql", "plsql" },
				callback = function()
					require("cmp").setup.buffer({
						sources = {
							{ name = "vim-dadbod-completion" },
							{ name = "buffer" },
							{ name = "luasnip" },
						},
					})
				end,
			})
		end,
	},
}
