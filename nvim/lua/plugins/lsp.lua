return {
    -- lsp server installer
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
        dependencies = { 'williamboman/mason-lspconfig.nvim', 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    },
    -- show signature from methods as float windows
    { 'ray-x/lsp_signature.nvim', dependencies = 'nvim-lspconfig', config = require('setup.lsp_signature').setup },
    {
        "neovim/nvim-lspconfig",
    -- event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("setup.lsp")
            local conf = lspconfig.setup()
            lspconfig.config_defaults()
        end,
    },
}
