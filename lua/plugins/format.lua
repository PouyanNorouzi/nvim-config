vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })
require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform will run multiple formatters sequentially
        python = { 'black' },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { 'rustfmt', lsp_format = 'fallback' },
        -- Conform will run the first available formatter
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        --  c and cpp
        cpp = { 'clang-format' },
        c = { 'clang-format' },
    },
})
vim.api.nvim_create_user_command('Format', function()
    require('conform').format()
end, { desc = 'Format the Buffer' })
