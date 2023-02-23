return {
    keys = {
        -- Navigation
        { "<localleader>k", "m[" },
        { "<localleader>j", "m]" },
        { "<localleader>p", "[[" },
        { "<localleader>n", "]]" },

        -- Actions
        { "dsm", "<Plug>(vimtex-env-delete-math)" },
        { "csm", "<Plug>(vimtex-env-change-math)" },
        { "tsm", "<Plug>(vimtex-env-toggle-math)" },

        -- Local Remaps
        { "<localleader><f1>", "<plug>(vimtex-env-surround-line)" },
        { "<localleader><f1>", "<plug>(vimtex-env-surround-operator)" },
        { "<localleader><f1>", "<plug>(vimtex-env-surround-visual)" },
        { "<localleader><f2>", "<plug>(vimtex-cmd-create)" },
        { "<localleader><f3>", "<plug>(vimtex-delim-add-modifiers)" },
    }
}
