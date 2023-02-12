-- Additional icons
--             
--           ﳠ  
--             
--      ⋗ Ω p 

local M = {}

M.types = {
    standard = {
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
    },
    other = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = '練',
        Interface = '練',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = '◩ ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = 'ﳠ ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
    }
}

M.lsp = {
    Error = "",
    Warn = "",
    Hint = "⚑",
    Info = "",
}

M.mason = {
    install = "✓",
    pending = "➜",
    uninstall = "✗",
}

M.git = {
    add = '',
    change = '',
    delete = '',
    -- TODO: Implement the following icons properly
    topdelete = '契',
    changedelete = '▎',
    untracked = '▎',
}

M.lualine = {
    component = {
        triangle = { left = '', right = '' },
        halfcircle = { left = '', right = '' },
    },
    section = {
        topslope = { left = '', right = '' },
        triangle = { left = '', right = '' },
        botslope = { left = ' ', right = ' ' },
        halfcircle = { left = '', right = '' },
        trapezoid = { left = '', right = '' },
        pixelslope = { left = '', right = '' },
        pixelbar = { left = '', right = '' },
        legoside = { left = '', right = '' },
        legorotated = { left = '', right = '' },
    },
}

M.bufferline = {
    indicator = '▎',
}

M.lualine = {
    time = " ",
}

M.dashboard = {
    update = ' ',
    files = ' ',
    apps = ' ',
    dotfiles = ' ',
}

M.comments = {
    fix = ' ',
    todo = ' ',
    hack = ' ',
    warn = ' ',
    perf = ' ',
    note = ' ',
    test = '⏲ ',
}

return M
