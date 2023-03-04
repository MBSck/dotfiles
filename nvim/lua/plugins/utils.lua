return {
    -- Extended folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        event = "BufReadPost",
        config = require("setup.ufo").setup,
    },

    -- File Tree browser
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = require('setup.neotree').setup,
        keys = require('setup.neotree').keys,
    },

    -- Better matchup for the % command
    { "andymass/vim-matchup", event = "BufReadPost", config = require("setup.matchup").setup },

    -- Simulates comfortable scroll motion
    -- { 'yuttie/comfortable-motion.vim', event = { "BufReadPost", "BufNewFile" } },

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
    {
        "lervag/vimtex",
        ft = "tex",
        config = require("setup.vimtex").setup,
        keys = require("setup.vimtex").keys,
    },

    -- Markdown-preview
    {
        "iamcco/markdown-preview.nvim",
        ft = { "md", "markdown" },
        config = require("setup.markdown-preview").setup,
        keys = require("setup.markdown-preview").keys,
        opts = require("setup.markdown-preview").opts,
    },

    -- Filetype specific plugins
    { "jeetsukumaran/vim-python-indent-black", ft = "py"},

    -- Debugger for various programming languages
    {
        "mfussenegger/nvim-dap",
        init = require("setup.dap").init,
        config = require("setup.dap").setup,
        dependencies = {
            { "rcarriga/nvim-dap-ui", config = require("dapui").setup() },
            "mfussenegger/nvim-dap-python",
            "jbyuki/one-small-step-for-vimkind",
            "theHamsta/nvim-dap-virtual-text",
        },
    },
}
