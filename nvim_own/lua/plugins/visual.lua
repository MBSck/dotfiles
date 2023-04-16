return {
    -- Colorful window separation to see what window is activ
    { 'nvim-zh/colorful-winsep.nvim', event = { "BufReadPost", "BufNewFile" }, config = require("setup.colorful-winsep").setup, },

    -- Nice indent guidelines
    { 'lukas-reineke/indent-blankline.nvim', event = "UIEnter", config = require("setup.indent-blankline").setup },

    -- Floating status lines
    { "b0o/incline.nvim", event = "BufReadPre", config = require("setup.incline").setup },

    -- Generates a scrollbar for neovim
    { 'petertriho/nvim-scrollbar', event = "BufReadPost", config = require("setup.scrollbar").setup },

    -- Dashboard
    { 'glepnir/dashboard-nvim', event = "UIEnter", config = require("setup.dashboard").setup },

    -- Overides the default vim notify method for a floating window
    { 'rcarriga/nvim-notify', event = "UIEnter", config = require("setup.notify").setup },

    -- Status progress for lsp servers
    { 'j-hui/fidget.nvim', event = "UIEnter", config = require('setup.fidget').setup },

    -- Highlights the code yanking
    { 'machakann/vim-highlightedyank', event = { "BufReadPost", "BufNewFile" } },

    -- URL highlighting
    { 'itchyny/vim-highlighturl', event = { "BufReadPost", "BufNewFile" } },

    -- Shows where one is at the top of the file
    {
        'stevearc/aerial.nvim',
        event = { "BufReadPost", "BufNewFile" },
        keys = { {'<leader>a', '<cmd>AerialToggle!<CR>', desc = "Toggle aerial"} },
    },

    -- Better visual comment displays
    { 'folke/todo-comments.nvim', event = { "BufReadPost", "BufNewFile" }, config = require("setup.todo-comments").setup },

    -- Gitsigns
    -- cmd = { "TodoTrouble", "TodoTelescope" },
    { 'lewis6991/gitsigns.nvim', event = { "BufReadPost", "BufNewFile" }, config = require("setup.gitsigns").setup },

    -- Status line
    { 'nvim-lualine/lualine.nvim', event = "UIEnter", config = require("setup.lualine").setup() },

    -- Bufferline
    {'romgrk/barbar.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = require("setup.barbar").setup,
        opts = require("setup.barbar").opts,
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- Colorscheme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        opts = { style = "moon" },
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
}
