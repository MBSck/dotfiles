return {
    setup = function()
        local icons = require("config.assets").icons
        require('telescope').setup({
            defaults = {
                -- Appearance
                entry_prefix = icons.telescope.entry_prefix..' ',
                prompt_prefix = icons.telescope.prompt_prefix..' ',
                selection_caret = icons.telescope.selection_caret..' ',
                color_devicons = true,

                -- Searching
                set_env = { COLORTERM = 'truecolor' },
                file_ignore_patterns = {
                    '.git/',
                    '%.jpg',
                    '%.jpeg',
                    '%.png',
                    '%.svg',
                    '%.otf',
                    '%.ttf',
                    '%.lock',
                    '__pycache__',
                    '%.sqlite3',
                    '%.ipynb',
                    'vendor',
                    'node_modules',
                    'dotbot',
                    'packer_compiled.lua',
                },

                -- Telescope smart history
                history = {
                    path = vim.fn.stdpath('data') .. '/databases/telescope_history.sqlite3',
                    limit = 100,
                },

    --         prompt_prefix = " ",
    --         selection_caret = " ",

                -- Mappings
                mappings = {
                    i = {
                        ['<ESC>'] = require('telescope.actions').close,
                        ['<C-j>'] = require('telescope.actions').move_selection_next,
                        ['<C-k>'] = require('telescope.actions').move_selection_previous,
                        ['<C-q>'] = require('telescope.actions').send_to_qflist,

                        -- ["<c-t>"] = function(...)
                        --     return require("trouble.providers.telescope").open_with_trouble(...)
                        -- end,
                        -- ["<a-i>"] = function()
                        --     Util.telescope("find_files", { no_ignore = true })()
                        -- end,
                        -- ["<a-h>"] = function()
                        --     Util.telescope("find_files", { hidden = true })()
                        -- end,
                        -- ["<C-Down>"] = function(...)
                        --     return require("telescope.actions").cycle_history_next(...)
                        -- end,
                        -- ["<C-Up>"] = function(...)
                        --     return require("telescope.actions").cycle_history_prev(...)
                        -- end,
                        -- ["<C-f>"] = function(...)
                        --     return require("telescope.actions").preview_scrolling_down(...)
                        -- end,
                        -- ["<C-b>"] = function(...)
                        --     return require("telescope.actions").preview_scrolling_up(...)
                        -- end,
                    },
                    n = { ['<ESC>'] = require('telescope.actions').close },
                    n = { ['q'] = require('telescope.actions').close },
                },
            },
        })
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('lsp_handlers')
        -- require('telescope').load_extension('dap')
        -- require('telescope').load_extension('session-lens')
        require('telescope').load_extension('file_browser')
    end,
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers show_all_buffers=true<cr>" },
        -- { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        -- { "<leader>fg", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
        --{ "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
        -- find
        --{ "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
        --{ "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
        -- { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },

        -- git
        -- { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        -- { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },

        -- search
        -- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
        -- { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        -- { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        -- { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
        -- { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
        -- { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        -- { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
        -- { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        -- { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        -- { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
        -- { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
        -- { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
        -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
        -- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },

        --"<leader>ss",
        --Util.telescope("lsp_document_symbols", {
        --symbols = {
        --"Class",
        --"Function",
        --"Method",
        --"Constructor",
        --"Interface",
        --"Module",
        --"Struct",
        --"Trait",
        --"Field",
        --"Property",
        --},
        --}),
        -- desc = "Goto Symbol",
    }
}
