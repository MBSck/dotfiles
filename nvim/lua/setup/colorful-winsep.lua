return {
    setup = function ()
        local assets = require("config.assets")
        local colors = assets.colors()
        local icons = assets.icons
        require("colorful-winsep").setup({
            -- Highlight for Window separator
            highlight = {
                bg = colors.bg_1,
                fg = colors.fg_2,
            },

            -- timer refresh rate
            interval = 30,

            -- This plugin will not be activated for filetype in the following table.
            no_exec_files = { "lazy", "TelescopePrompt", "mason", "neo-tree" },

            -- Symbols for separator lines, the order: horizontal, vertical, top left,
            -- top right, bottom left, bottom right.
            symbols = icons.colorful_winsep,

            -- Executed after closing the window separator
            -- close_event = function()
            -- end,

            -- Executed after creating the window separator
            -- create_event = function()
            -- end,
        })
    end
}

