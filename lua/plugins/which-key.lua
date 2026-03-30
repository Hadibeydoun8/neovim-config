return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay = 500, -- ms delay before popup appears
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer keymaps (which-key)",
        },
    },
}
