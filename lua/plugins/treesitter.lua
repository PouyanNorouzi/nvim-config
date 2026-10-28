vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
            if not ev.data.active then
                vim.cmd.packadd('nvim-treesitter')
            end
            vim.cmd('TSUpdate')
        end
    end,
})

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

require('nvim-treesitter').setup({})

-- Parsers to install (async, skips ones already installed)
require('nvim-treesitter').install({ 'lua', 'vim', 'vimdoc', 'query', 'bash', 'json', 'markdown', 'c', 'cpp' })

-- On main, highlighting is not enabled automatically
vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
        if pcall(vim.treesitter.start, ev.buf) then
            -- optional: treesitter-based indent
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
