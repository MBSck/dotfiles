return {
    setup = function(signature, winbar_sig)
        local function search_result()
            if vim.v.hlsearch == 0 then
                return ''
            end
            local last_search = vim.fn.getreg('/')
            if not last_search or last_search == '' then
                return ''
            end
            local searchcount = vim.fn.searchcount({ maxcount = 9999 })
            return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                -- component_separators = require("config.icons").lualine.component.triangle,
                -- section_separators = require("config.icons").lualine.section.triangle,
                disabled_filetypes = {
                    winbar = { 'neo-tree', 'dashboard', 'help', 'toggleterm' },
                },
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'diff', 'branch' },
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                    signature,
                },
                -- TODO: Implement the diagnostics as well as the icons properly
                lualine_x = {
                    -- substitute(),
                    search_result,
                    'encoding',
                    'filetype',
                    {
                        'overseer',
                    },
                    -- {
                        -- 'diagnostics',
                        -- sources = { 'nvim-lsp' },
                        -- symbols = { require("config.icons").lsp },
                        -- always_visible = true,
                    -- },
                },
                lualine_y = {
                    { 'progress', separator = "", padding = { left = 1, right = 0 } },
                    { 'location', padding = { left = 0, right = 1 } },
                },
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        winbar_sig,
                        color = { bg = '#E6E9EF' },
                    },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        'filename',
                        file_status = 1,
                        path = 0,
                    },
                },
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        winbar_sig,
                        color = { bg = '#E6E9EF' },
                    },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        'filename',
                        file_status = 1,
                        path = 1,
                    },
                },
            },
            extensions = { "neo-tree" },
        })
    end,
}
