return {
    setup = function()
        local assets = require("config.assets")
        local icons = assets.icons
        local headers = assets.headers

        local function random_quote()
            local quotes = require("config.quotes").star_trek

            math.randomseed(os.clock())
            local quote_index = math.random() * #quotes
            return quotes[math.floor(quote_index) + 1]
        end

        local function date_time()
            local clock = icons.dashboard.clock.." "..os.date("%H:%M")
            local date = icons.dashboard.date.." "..os.date("%d-%m-%y")
            return { clock, date }
        end

        require("dashboard").setup({
            theme = "doom",
            config = {
                header = { headers.neovim_banner },
                -- week_header = { enable = true, },
                center = {
                    {
                        icon = icons.dashboard.update,
                        icon_hl = '@property',
                        desc = ' Update',
                        desc_hl = '@property',
                        key = 'u',
                        key_hl = 'Number',
                        action = 'Lazy update',
                    },
                    {
                        icon = icons.dashboard.files,
                        icon_hl = 'Label',
                        desc = ' Files',
                        desc_hl = 'Label',
                        key = 'f',
                        key_hl = 'Number',
                        action = 'Telescope find_files',
                    },
                    {
                        icon = icons.dashboard.apps,
                        icon_hl = 'DiagnosticHint',
                        desc = ' Apps',
                        desc_hl = 'DiagnosticHint',
                        key = 'a',
                        key_hl = 'Number',
                        action = 'Telescope app',
                    },
                    {
                        icon = icons.dashboard.dotfiles,
                        icon_hl = 'String',
                        desc = ' Dotfiles',
                        desc_hl = 'String',
                        key = 'd',
                        key_hl = 'Number',
                        action = 'Telescope dotfiles',
                    },
                    {
                        icon = icons.dashboard.exit,
                        icon_hl = 'Directory',
                        desc = ' Exit',
                        desc_hl = 'Directory',
                        key = 'q',
                        key_hl = 'Number',
                        action = ':q',
                    },
                },
                footer = { }
            }
        })
    end,
}
