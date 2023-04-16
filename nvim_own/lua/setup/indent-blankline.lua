return {
    setup = function()
        vim.opt.list = true
        vim.opt.listchars:append "eol:↴"
        require("indent_blankline").setup({
            -- Context is off by default, turn it on
            show_current_context = false,
            show_current_context_start = false,
            show_end_of_line = true,
    })
    end
}
