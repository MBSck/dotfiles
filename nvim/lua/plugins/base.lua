return {
    'farmergreg/vim-lastplace', -- remembers cursor position with nice features in comparison to just an autocmd
    'nvim-lua/plenary.nvim', -- serveral lua utilities
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup()
        end,
    }, -- icon support for several plugins
    'MunifTanjim/nui.nvim', -- base ui components for nvim
    'stevearc/dressing.nvim', -- overrides the default vim input to provide better visuals
}
