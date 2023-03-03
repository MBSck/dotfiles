return {
    setup = function()
        local icons = require("config.icons")
        local colors = require("config.colors")

        require("scrollbar").setup({
            show = true,
            show_in_active_only = true,
            set_highlights = true,
            folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
            max_lines = false, -- disables if no. of lines in buffer exceeds this
            hide_if_all_visible = false, -- Hides everything if all lines are visible
            throttle_ms = 100,
            handle = { color = colors.bg_highlight },
            excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neotree" },
            marks = {
                Cursor = { text = icons.scrollbar.body },
                Search = { color = colors.orange },
                Error = { color = colors.error },
                Warn = { color = colors.warning },
                Info = { color = colors.info },
                Hint = { color = colors.hint },
                Misc = { color = colors.purple },
                GitAdd = { color = colors.git_add },
                GitChange = { color = colors.git_change },
                GitDelete = { color = colors.git_delete },
            },
            handlers = {
                cursor = true,
                diagnostic = true,
                gitsigns = true, -- Requires gitsigns
                handle = true,
                search = false, -- Requires hlslens
            },
        })
    end,
}
