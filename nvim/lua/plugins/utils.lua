return {
    -- File Tree browser
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

    -- Simulates comfortable scroll motion
    { 'yuttie/comfortable-motion.vim', event = { "BufReadPost", "BufNewFile" } },

    -- Better terminal
    { 'akinsho/toggleterm.nvim', event = "BufEnter", config = require('setup.toggleterm').setup },

    -- Comment functionality
    { 'numToStr/Comment.nvim', event = "BufEnter", config = require('setup.comment').setup },

    -- Whitespace stripping
    { 'ntpeters/vim-better-whitespace', event = "BufEnter", keys = require("setup.vim-better-whitespace").keys },

    -- File finder
    {
        'nvim-telescope/telescope.nvim',
        keys = require("setup.telescope").keys,
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

    -- VimTex
    { "lervag/vimtex", event = "BufEnter *.tex", keys = require("setup.vimtex").keys },

    -- Markdown-preview
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     event = "BufEnter *.md",
    --     opts = require("setup.markdown-preview").opts,
    --     keys = require("setup.markdown-preview").keys,
    -- },
}
