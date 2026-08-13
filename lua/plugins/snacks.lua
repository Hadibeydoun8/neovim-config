-- lua/plugins/snacks.lua
-- lua/plugins/snacks.lua
return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,

    opts = {
        bigfile = { enabled = true },
        notifier = { enabled = true },
        terminal = { enabled = true },
        lazygit = { enabled = true },
        scratch = { enabled = true },

        dashboard = { enabled = false },
        indent = { enabled = false },

        explorer = {
            enabled = true,
            replace_netrw = true,
        },

        picker = {
            enabled = true,
        },
    },

    keys = {
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
            desc = "File Explorer",
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<c-/>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle Terminal",
        },
        {
            "<leader>.",
            function()
                Snacks.scratch()
            end,
            desc = "Scratch Buffer",
        },
        {
            "<leader>un",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss Notifications",
        },
    },
}
