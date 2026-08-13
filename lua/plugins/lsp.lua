return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
                    "clangd",
                    "rust_analyzer",
                    "omnisharp",
                    "lua_ls",
                },
            })

            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            -- Use Apple's SourceKit-LSP from the active Xcode toolchain.
            vim.lsp.config("sourcekit", {
                cmd = { "xcrun", "sourcekit-lsp" },
            })

            vim.lsp.enable({
                "ts_ls",
                "clangd",
                "rust_analyzer",
                "omnisharp",
                "lua_ls",
                "sourcekit",
            })
        end,
    },
}
