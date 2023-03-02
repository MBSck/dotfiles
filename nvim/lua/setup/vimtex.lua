return {
    setup = function ()
        vim.g.vimtex_view_general_viewer = 'okular'
        vim.g.vimtex_compiler_latexmk_engines = {
            _ = '-xelatex'
        }
        vim.g.tex_comment_nospell = 1
        vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
    end,
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
