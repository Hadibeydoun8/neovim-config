return {
    "saghen/blink.cmp",

    version = "1.*",

    dependencies = {
        "rafamadriz/friendly-snippets",
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
