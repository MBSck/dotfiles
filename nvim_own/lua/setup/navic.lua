return {
    setup = function()
        require('nvim-navic').setup({
            icons = { require('lspkind').presets.default },
            highlight = true,
            separator = " > ",
            depth_limit = 3,
            depth_limit_indicator = "..",
            safe_output = true
        })
        vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end,
}
