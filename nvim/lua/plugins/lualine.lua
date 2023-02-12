local icons = require("config.icons")

return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
            icons_enabled = true,
            disabled_filetypes = { statusline = { "dashboard", "lazy"} },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {
                { 'progress', separator = "", padding = { left = 1, right = 0 } },
                { 'location', padding = { left = 0, right = 1 } },
            },
            lualine_z = {
                function()
                    return icons.lualine.time.." ".. os.date("%R")
                end,
            }
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "neo-tree" },

    }
}
