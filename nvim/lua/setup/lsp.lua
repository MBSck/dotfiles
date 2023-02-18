local M = {}

M.on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        require('nvim-navic').attach(client, bufnr)
    end

    local nnoremap = require("remaps.keymap").nnoremap
    local inoremap = require("remaps.keymap").inoremap

    nnoremap("K", function() vim.lsp.buf.hover() end, opts)
    inoremap("<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    nnoremap("<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    nnoremap("<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, opts)
    nnoremap("<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
    nnoremap("<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
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

    -- require('setup.autocommand').lsp_autocmds(client, bufnr)
    -- check if this is applicable (for rust for example it is not)
    -- https://github.com/L3MON4D3/LuaSnip/wiki/Misc#improve-language-server-snippets
end

M.capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    return capabilities
end

M.diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
}

M.setup = function()
    -- Diagnostic icons
    for name, icon in pairs(require("config.icons").lsp) do
        name = "DiagnosticSign" .. (name:gsub("^%l", string.upper))
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
    vim.diagnostic.config(M.diagnostics)

    local lspconfig = require('lspconfig')
    require('mason-lspconfig').setup_handlers({
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = M.on_attach,
                capabilities = M.capabilities,
            })
        end,
    })
end

return M
