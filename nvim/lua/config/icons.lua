-- Additional icons
--             
--           ﳠ  
--            

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

M.lualine = {
    time = "",
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

M.kinds = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = "ﳠ ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
}

return M
