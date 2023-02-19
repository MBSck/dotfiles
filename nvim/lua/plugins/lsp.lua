return {
    -- Lsp configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
            { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
            { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
        },
        config = require("setup.lsp").setup,
    },
    -- show signature from methods as float windows
    -- { 'ray-x/lsp_signature.nvim', dependencies = 'nvim-lspconfig', config = require('setup.lsp_signature').setup },
}
