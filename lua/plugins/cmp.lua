return {
	"saghen/blink.cmp",

	version = "1.*",

	dependencies = {
		"rafamadriz/friendly-snippets",
		"brenoprata10/nvim-highlight-colors",
	},

	opts = {
		keymap = {
			preset = "enter",

			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
			per_filetype = {
				sql = { "dadbod", "buffer", "snippets" },
			},
			providers = {
				dadbod = {
					name = "Dadbod",
					module = "vim_dadbod_completion.blink",
				},
			},
		},

		completion = {
			documentation = {
				auto_show = true,
			},
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								-- 1. Show live color preview swatch if item is a color class
								local highlight_colors = require("nvim-highlight-colors")
								local color_item = highlight_colors.format(ctx.item.documentation, { kind = ctx.kind })
								if color_item and color_item.abbr ~= "" then
									return color_item.abbr .. ctx.icon_gap
								end

								-- 2. Show Tailwind icon for non-color Tailwind utility classes
								local client = ctx.item.client_id and vim.lsp.get_client_by_id(ctx.item.client_id)
								if client and client.name == "tailwindcss" then
									return "󱏿" .. ctx.icon_gap
								end

								-- 3. Fallback to default LSP kind icon
								return ctx.kind_icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								-- Apply dynamic hex color to the swatch
								local highlight_colors = require("nvim-highlight-colors")
								local color_item = highlight_colors.format(ctx.item.documentation, { kind = ctx.kind })
								if color_item and color_item.abbr_hl_group then
									return color_item.abbr_hl_group
								end

								-- Apply Tailwind cyan to non-color Tailwind items
								local client = ctx.item.client_id and vim.lsp.get_client_by_id(ctx.item.client_id)
								if client and client.name == "tailwindcss" then
									return "BlinkCmpKindTailwind"
								end

								return "BlinkCmpKind" .. ctx.kind
							end,
						},
					},
				},
			},
		},

		signature = {
			enabled = true,
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},

	opts_extend = { "sources.default" },
}
