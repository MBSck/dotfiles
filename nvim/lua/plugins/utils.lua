return {
    -- file browser
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' },
        config = require('setup.neotree').setup,
    },
    -- better terminal
    { 'akinsho/toggleterm.nvim', config = require('setup.toggleterm').setup },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { -- pickers
            'gbrlsnchs/telescope-lsp-handlers.nvim',
            'nvim-telescope/telescope-dap.nvim',
            'nvim-telescope/telescope-live-grep-raw.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-symbols.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = require('setup.telescope').setup,
    },
}
