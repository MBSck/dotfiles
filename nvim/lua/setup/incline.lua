return {
    setup = function()
        local colors = require("config.assets").colors()
        require("incline").setup({
            highlight = {
                groups = {
                    InclineNormal = { guibg = colors.pink, guifg = colors.black },
                    InclineNormalNC = { guifg = colors.pink, guibg = colors.black },
                },
            },
            window = { margin = { vertical = 0, horizontal = 1 } },
            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                return { { icon, guifg = color }, { " " }, { filename } }
            end,
        })
    end,
}
