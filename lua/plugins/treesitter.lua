return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        -- Install parsers for your languages
        require('nvim-treesitter').install({
            'lua', 'rust', 'cpp', 'c_sharp',
            'tsx', 'typescript', 'javascript',
            'vim', 'vimdoc',
        }):wait(30000)

        -- Enable highlighting per filetype
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(event)
                pcall(vim.treesitter.start, event.buf, event.match)
            end
        })
    end
}
