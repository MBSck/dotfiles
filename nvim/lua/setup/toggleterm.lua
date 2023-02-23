return {
    setup = function()
        require('toggleterm').setup({
            size = function(term)
                if term.direction == 'horizontal' then
                    return vim.o.lines * 0.3
                elseif term.direction == 'vertical' then
                    return vim.o.columns * 0.4
                end
            end,
            hide_numbers = false,               -- Hide the number column in toggleterm buffers
            shade_terminals = true,             -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            start_in_insert = true,
            insert_mappings = true,             -- Whether or not the open mapping applies in insert mode
            persist_size = true,
            auto_scroll = true,                 -- Automatically scroll to the bottom on terminal output
            direction = 'horizontal',
            close_on_exit = false,              -- Close the terminal window when the process exits
            shell = vim.o.shell,                -- Change the default shell
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'curved',              -- Border style: 'single' | 'double' | 'shadow' | 'curved' |
            },
            winbar = {
                enabled = true,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end
            },
        })
        -- Python package
        -- local python_package_cmd = "python3 -m "..vim.fn.fnamemodify(vim.fn.fnamemodify(vim.fn.getcwd(), ":h"), ":t").."."..vim.fn.fnamemodify(vim.fn.getcwd(), ":t").."."..vim.fn.expand("%:t:r")

        -- Terminal variables
        local Terminal = require("toggleterm.terminal").Terminal
        local terminal = Terminal:new({ float_opts = { border = "double", }, close_on_exit = true, })
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            start_in_insert = false,
            close_on_exit = true,
            direction = "float",
            float_opts = { border = "double", },

            -- function to run on opening the terminal
            on_open = function(term)
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
            end,
        })
        local filetype_cmd = {
            python = "python3",
            rust = "cargo run",
        }

        -- TODO: Implement this and check how one can see if terminals insert mode is
        -- activated and if it is leave it and untoggle the Terminal and then when key is
        -- hit again open terminal and go back into insert mode
        -- local function _toggle_terminal()
        --     if
        -- end

        -- TODO: Check out the better functionality provided by toggelterm and implement
        -- it as well...

        -- This function returns both the filetypes executable and a bool that tells if
        -- there is need for a file to be attached to the command
        local function _get_file_executable(filetype)
            if filetype == "python" then
            -- TODO: Implement pytest here by checking if the filename contains test, if
                -- it is a python file (should work for most cases)
                return filetype_cmd.python, true
            elseif filetype == "rust" then
                return filetype_cmd.rust, false
            else
                return nil, false
            end
        end

        local function _filetype_toggle()
            local filetype = vim.bo.filetype
            local executable, file_needed = _get_file_executable(filetype)
            if executable ~= nil then
                if file_needed then
                    local file = vim.fn.expand("%, t")
                    Terminal:new({ cmd = executable.." "..file, }):toggle()
                elseif not file_needed then
                    Terminal:new({ cmd = executable, }):toggle()
                end
            else
                local title = "Toggleterm Filetype Execution"
                local message = "The filetype '"..filetype.."' is not supported."
                vim.notfiy = require("notify")
                vim.notify(message, "error", { title = title})
            end
        end

        local nnoremap = require("remaps.keymap").nnoremap
        nnoremap("<f2>", function() lazygit:toggle() end, { silent = true })
        nnoremap("<f4>", function() terminal:toggle() end, { silent = true })
        nnoremap("<f5>", function() _filetype_toggle() end, { silent = true })
    end,
}
