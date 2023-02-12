local icons = require("config.icons")

return {
    -- Installer for lsp-servers and more
    {
        'williamboman/mason.nvim',
        -- opts = {
        -- ui = {
        -- icons = {
        -- package_installed = icons.mason.install,
        -- package_pending = icons.mason.pending,
        -- package_uninstalled = icons.mason.uninstall
        -- },
        -- },
        -- },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "hrsh7th/cmp-nvim-lsp",
            },
        },
        ---@class PluginLspOpts
        opts = {
            -- options for vim.diagnostic.config()
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●" },
                severity_sort = true,
            },
            -- Automatically format on save
            autoformat = true,
            -- options for vim.lsp.buf.format
            -- `bufnr` and `filter` is handled by the LazyVim formatter,
            -- but can be also overriden when specified
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
            -- LSP Server Settings
            ---@type lspconfig.options
            servers = { },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                -- tsserver = function(_, opts)
                --   require("typescript").setup({ server = opts })
                --   return true
                -- end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
            on_attach = function(client, bufnr)
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
            end
        },
        ---@param opts PluginLspOpts
        config = function(plugin, opts)
            -- diagnostics
            for name, icon in pairs(require("config.icons").lsp) do
                name = "DiagnosticSign" .. name
                vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
            end
            vim.diagnostic.config(opts.diagnostics)

            local servers = opts.servers
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                }, servers[server] or {})

                if opts.setup[server] then
                    if opts.setup[server](server, server_opts) then
                        return
                    end
                elseif opts.setup["*"] then
                    if opts.setup["*"](server, server_opts) then
                        return
                    end
                end
                require("lspconfig")[server].setup(server_opts)
            end

            local mlsp = require("mason-lspconfig")
            local available = mlsp.get_available_servers()

            local ensure_installed = {} ---@type string[]
            for server, server_opts in pairs(servers) do
                if server_opts then
                    server_opts = server_opts == true and {} or server_opts
                    -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
                    if server_opts.mason == false or not vim.tbl_contains(available, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end

            require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
            require("mason-lspconfig").setup_handlers({ setup })
        end,
    }
}