return {
    -- file browser
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        event = "BufEnter",
        config = require('setup.neotree').setup,
    },
    -- better terminal
    { 'akinsho/toggleterm.nvim', event = "BufEnter", config = require('setup.toggleterm').setup },
    { 'numToStr/Comment.nvim', event = "BufEnter", config = require('setup.comment').setup },
    {
        'ntpeters/vim-better-whitespace',
        event = "BufEnter",
        keys = {
            { "<leader>wr", ":StripWhitespace<cr>" },
            { "<leader>wt", ":ToggleWhitespace<cr>" },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
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
