return {
    'ntpeters/vim-better-whitespace',
    -- opts = {
        -- better_whitespace_enabled=0
        -- strip_whitespace_on_save=0
    -- },
    keys = {
        { "<leader><f7>", ":StripWhitespace<cr>" },
        { "<f7>", ":ToggleWhitespace<cr>" },
    },
}

