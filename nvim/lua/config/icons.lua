-- Additional icons
-- , , 

local M = {}

M.cmp = {
    lsp = 'ƒ',
    snippets = '⋗',
    buffer = 'Ω',
    path = '🖫',
}

M.lsp = {
    error = "",
    warn = "",
    hint = "⚑",
    info = "",
}

M.mason = {
    install = "✓",
    pending = "➜",
    uninstall = "✗",
}

M.git = {
    add = '',
    modify = '',
    remove = ''
}

M.lualine = {
    component = {
        left = '',
        right = ''
    },
    section = {
        left = '',
        right = ''},
}

M.bufferline = {
    indicator = '▎',
}

M.dashboard = {
    update = '',
    files = '',
    apps = '',
    dotfiles = '',
}

M.comments = {
    fix = '',
    todo = '',
    hack = '',
    warn = '',
    perf = '',
    note = '',
    test = '⏲',
}

return M
