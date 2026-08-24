if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
    vim.g.clipboard = 'osc52'
    vim.opt.clipboard = 'unnamedplus'
end
