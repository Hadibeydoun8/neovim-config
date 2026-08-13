return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 300, -- ms delay before popup appears
        spec = {
            { "<leader>f", group = "Find (Telescope)" },
            { "<leader>d", group = "Database" },
            { "<leader>o", group = "Overseer (tasks)" },
            { "<leader>g", group = "Git" },
            { "<leader>x", group = "Trouble/Diagnostics" },
            { "<leader>c", group = "Code" },
        },
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer keymaps (which-key)",
        },
        {
            "<leader>k",
            function() require("which-key").show({ global = true }) end,
            desc = "All keymaps (which-key)",
        },
    },
}
