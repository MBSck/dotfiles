-- Additional icons
--             
--           ﳠ  
--             
--      ⋗ Ω p 

local M = {}

-- TODO: Reorder icons in shapes and similar

M.general = {
    devil = "",
    settings = "",
    bar = "▊",
}

M.kind = {
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
    change = '',
    delete = '',
    -- TODO: Implement the following icons properly
    topdelete = '契',
    changedelete = '▎',
    untracked = '▎',
    branch =  "",
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
    update = '',
    files = '',
    apps = '',
    dotfiles = '',
    exit = '',
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

M.neotree ={
    indent_marker = "│",
    last_indent_maker = "└",
    expander_collapse = "",
    expander_expanded = "",
    folder_closed = "",
    folder_open = "",
    folder_empty = "ﰊ",
    default = "*",
    git = {
        added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "✖",-- this can only be used in the git_status source
        renamed = "",-- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored = "",
        staged = "",
        unstaged = "",
        conflict = "",
    }
} 

return M
