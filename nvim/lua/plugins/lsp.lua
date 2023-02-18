return {
    -- lsp server installer
    {
        'williamboman/mason.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = require("setup.mason").setup,
        dependencies = { 'williamboman/mason-lspconfig.nvim', 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    },
    -- Lsp configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = require("setup.lsp").setup,
        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
            { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
        },

        -- show signature from methods as float windows
        { 'ray-x/lsp_signature.nvim', dependencies = 'nvim-lspconfig', config = require('setup.lsp_signature').setup },
    }
}
