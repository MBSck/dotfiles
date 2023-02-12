return {
    { 'rcarriga/nvim-notify', config = { require("setup.notify").setup },
    {
    'nvim-lualine/lualine.nvim',
    event = "UIEnter",
    config = function()
        local signature = require("setup.lsp_signature")
        require("setup.lualine").setup(
            signature.status_line,
            require("setup.nvim-navic").winbar,
            require("setup.substitute").status_line
        )
    end,
    }
}
