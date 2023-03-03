return {
    -- Mason config
    {
        'williamboman/mason.nvim',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        config = require("setup.mason").setup,
    },

    -- Lsp configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
            { 'SmiteshP/nvim-navic', config = require("setup.nvim-navic").setup, },
            { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
            { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
        },
        config = require("setup.lsp").setup,
    },
    -- show signature from methods as float windows
    {
        'ray-x/lsp_signature.nvim',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = 'nvim-lspconfig',
        config = require('setup.lsp_signature').setup,
    },

    { 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', event = { "BufReadPre", "BufNewFile" } },
}
