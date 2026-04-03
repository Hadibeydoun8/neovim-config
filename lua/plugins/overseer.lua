return {
	"stevearc/overseer.nvim",
	cmd = {
		"OverseerRun",
		"OverseerToggle",
		"OverseerBuild",
		"OverseerRunCmd",
		"OverseerInfo",
	},
	keys = {
		{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
		{ "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
		{ "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Build task" },
		{ "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
		{ "<leader>oc", "<cmd>OverseerRunCmd<cr>", desc = "Run shell command" },
	},
	opts = {
		strategy = "terminal",
		templates = { "builtin" },
		task_list = {
			direction = "bottom",
			default_detail = 2,
			min_height = 12,
			bindings = {
				["<CR>"] = "RunAction",
				["o"] = "Open",
				["p"] = "TogglePreview",
				["<C-r>"] = "Restart", -- re-run like Ctrl+Shift+F10 in JetBrains
				["<C-x>"] = "Dispose", -- kill + remove
				["q"] = "Close",
				["?"] = "ShowHelp",
			},
		},
		-- Send cargo errors to the quickfix/diagnostics list (like JetBrains build output)
		component_aliases = {
			default = {
				{ "display_duration", detail_level = 2 },
				"on_output_summarize",
				"on_exit_set_status",
				"on_complete_notify",
				{ "on_complete_dispose", timeout = 900, require_view = { "SUCCESS" } },
			},
		},
	},
	config = function(_, opts)
		local overseer = require("overseer")
		overseer.setup(opts)

		-- Hook: send cargo build/test output to quickfix automatically
		overseer.add_template_hook({ module = "^cargo" }, function(task_defn, util)
			util.add_component(task_defn, { "on_output_quickfix", open_on_exit = "failure" })
		end)
	end,
}
