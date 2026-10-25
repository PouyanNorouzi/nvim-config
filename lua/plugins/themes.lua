vim.pack.add({ 'https://github.com/daltonmenezes/aura-theme' })

local plugin = vim.pack.get({ 'aura-theme' })[1]

if plugin then
    vim.opt.rtp:append(plugin.path .. '/packages/neovim')
end

local ok = pcall(vim.cmd.colorscheme, 'aura-soft-dark')
if not ok then
    vim.notify('aura-dark colorscheme not found, check the runtimepath', vim.log.levels.WARN)
end
