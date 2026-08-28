return {
	"stevearc/overseer.nvim",
	-- Do NOT pin to v1.6.0 — it uses APIs removed in Neovim 0.12
	-- Use latest HEAD or v2.0.0+ tag
	cmd = {
		"OverseerRun",
		"OverseerToggle",
		"OverseerRunCmd",
		"OverseerInfo",
	},
	keys = {
		{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
		{ "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
		{ "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
		{ "<leader>oc", "<cmd>OverseerRunCmd<cr>", desc = "Run shell command" },
	},
	opts = {
		-- "terminal" wraps the deprecated termopen(); jobstart uses jobstart({term=true})
		strategy = "jobstart",
		templates = { "builtin" },
		task_list = {
			direction = "bottom",
			default_detail = 2,
			min_height = 12,
			bindings = {
				["<CR>"] = "RunAction",
				["o"] = "Open",
				["p"] = "TogglePreview",
				["<C-r>"] = "Restart",
				["<C-x>"] = "Dispose",
				["q"] = "Close",
				["?"] = "ShowHelp",
			},
		},
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

		overseer.add_template_hook({ module = "^cargo" }, function(task_defn, util)
			util.add_component(task_defn, {
				"on_output_quickfix",
				open_on_exit = "failure",
			})
		end)
	end,
}
