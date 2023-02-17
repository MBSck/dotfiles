return {
    -- Dashboard
    { 'glepnir/dashboard-nvim', event = "UIEnter", config = require("setup.dashboard").setup },
    -- Overides the default vim notify method for a floating window
    { 'rcarriga/nvim-notify', event = "UIEnter", config = require("setup.notify").setup },
    -- Status progress for lsp servers
    { 'j-hui/fidget.nvim', config = require('setup.fidget').setup },
    -- Shows where one is at the top of the file
    {
        'stevearc/aerial.nvim',
        event = { "BufReadPost", "BufNewFile" },
        keys = { {'<leader>a', '<cmd>AerialToggle!<CR>', desc = "Toggle aerial"} },
    },
    -- Better visual comment displays
    { 
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = require("setup.todo-comments").setup
    },
    -- cmd = { "TodoTrouble", "TodoTelescope" },
    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = require("setup.gitsigns").setup },
    -- Status line
    {
    'nvim-lualine/lualine.nvim',
    event = "UIEnter",
    config = function()
        require("setup.lualine").setup(
            require("setup.lsp_signature").status_line,
            require("setup.nvim-navic").winbar
        )
    end,
    },
    { 'nanozuki/tabby.nvim', event = "UIEnter", config = require('setup.tabline').setup },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = { style = "moon" },
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
}
