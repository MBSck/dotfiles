return {
    setup = function()
        local icons = require("config.icons")
        require("dashboard").setup({
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = icons.dashboard.update..' Update',
                        group = '@property',
                        action = 'Lazy update',
                        key = 'u'
                    },
                    {
                        desc = icons.dashboard.files..' Files',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        desc = icons.dashboard.apps..' Apps',
                        group = 'DiagnosticHint',
                        action = 'Telescope app',
                        key = 'a',
                    },
                    {
                        desc = icons.dashboard.dotfiles..' Dotfiles',
                        group = 'Number',
                        action = 'Telescope dotfiles',
                        key = 'd',
                    },
                    {
                        desc = icons.dashboard.exit..' Exit',
                        group = 'Directory',
                        action = ':q',
                        key = 'q',
                    },
                }
            }
        })
    end,
}
