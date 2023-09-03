M = {}

function M.lsp_keymaps(bufnr)
    local keymaps = require("config.utils").keymaps
    local nnoremap = keymaps.nnoremap
    local inoremap = keymaps.inoremap
    local opts = { noremap = true, silent = true }

    nnoremap("K", function() vim.lsp.buf.hover() end, opts)
    inoremap("<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    nnoremap("<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    nnoremap("<leader>wsa", function() vim.lsp.buf.add_workspace_folder() end, opts)
    nnoremap("<leader>wsr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
    nnoremap("<leader>wsl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    nnoremap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
    nnoremap("<leader>gi", function() vim.lsp.buf.implementation() end, opts)
    nnoremap("<leader>gD", function() vim.lsp.buf.declaration() end, opts)
    nnoremap("<leader>gd", function() vim.lsp.buf.definition() end, opts)
    nnoremap("<leader>gn", function() vim.diagnostic.goto_next() end, opts)
    nnoremap("<leader>gp", function() vim.diagnostic.goto_prev() end, opts)
    nnoremap("<leader>gr", function() vim.lsp.buf.references() end, opts)
    nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    nnoremap("<leader>rn", function() vim.lsp.buf.rename() end, opts)
    nnoremap("<leader>f", function() vim.lsp.buf.format { async = true } end, opts)
end

function M.lsp_attach(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        require('nvim-navic').attach(client, bufnr)
    end
    M.lsp_keymaps(bufnr)

    -- require('setup.autocommand').lsp_autocmds(client, bufnr)
    -- check if this is applicable (for rust for example it is not)
    -- https://github.com/L3MON4D3/LuaSnip/wiki/Misc#improve-language-server-snippets
end

function M.lsp_capabilities(lspconfig)
    local lsp_defaults = lspconfig.util.default_config
    local lsp_capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
    )
    return lsp_capabilities
end

M.diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = require("config.assets").icons.lsp.prefix },
    severity_sort = true,
}

M.setup = function()
	require("neodev").setup({})
    local lspconfig = require('lspconfig')
    local get_servers = require('mason-lspconfig').get_installed_servers

    for _, server_name in ipairs(get_servers()) do
        lspconfig[server_name].setup({
            on_attach = M.lsp_attach,
            capabilities = M.lsp_capabilities(lspconfig),
        })
    end

    for name, icon in pairs(require("config.assets").icons.lsp) do
        name = "DiagnosticSign" .. (name:gsub("^%l", string.upper))
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
    vim.diagnostic.config(M.diagnostics)
end

return M