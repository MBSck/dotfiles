local nnoremap = require("remaps.keymap").nnoremap
local inoremap = require("remaps.keymap").inoremap

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-tool-installer").setup({
    -- List of tools to be ensured installed
    ensure_installed = {
        {"lua-language-server", auto_update = true},        -- Lua LSP-server
        {"vim-language-server", auto_update = true},        -- Vim LSP-server
        {"python-lsp-server", auto_update = true},          -- Python LSP-server
        {"rust_analyzer", auto_update = true},              -- Rust LSP-server
        {"json-lsp", auto_update = true},                   -- JSON LSP-server
        {"ltex-ls", auto_update = true},                    -- LaTeX LSP-server
        {"taplo", auto_update = true},                      -- TOML LSP-server
    },
    -- if set to true this will check each tool for updates. If updates
    -- are available the tool will be updated. This setting does not
    -- affect :MasonToolsUpdate or :MasonToolsInstall.
    -- Default: false
    auto_update = false,

    -- automatically install / update on startup. If set to false nothing
    -- will happen on startup. You can use :MasonToolsInstall or
    -- :MasonToolsUpdate to install tools and check for updates.
    -- Default: true
    run_on_start = true,

    -- set a delay (in ms) before the installation starts. This is only
    -- effective if run_on_start is set to true.
    -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
    -- Default: 0
    start_delay = 3000, -- 3 second delay

    -- Only attempt to install if 'debounce_hours' number of hours has
    -- elapsed since the last time Neovim was started. This stores a
    -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
    -- This is only relevant when you are using 'run_on_start'. It has no
    -- effect when running manually via ':MasonToolsInstall' etc....
    -- Default: nil
    debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

-- Notify lsp of the autocompletion capability
-- local lsp_capabilities = require("cmp_nvim_lsp").lsp_capabilities

-- LSP Keybindings
local lsp_attach = function(client, bufnr)
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
end

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
        })
    end,
})

-- This sets the icons for the LSP
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

-- LSP icons
sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

-- Diagnostics Options
vim.diagnostic.config({
    virtual_text = true,                    -- Show diagnistic messages via virtual text
    signs = true,                           -- Show a sign next to the line with a diagnostic
    severity_sort = true,                   -- Order diagnostics by severity
    update_in_insert = false,               -- Update diagnostics while editing in insert mode
    underline = true,                       -- Use an underline to show a diagnostic location
    float = {                               -- Show diagnostic messages in floating windows
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- If the server behave weirdly exchange the lsp-config to this
--local lspconfig = require('lspconfig')
--local get_servers = require('mason-lspconfig').get_installed_servers

--for _, server_name in ipairs(get_servers()) do
  --lspconfig[server_name].setup({
    --on_attach = lsp_attach,
    --capabilities = lsp_capabilities,
  --})
--end
