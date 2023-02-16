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
            hide_numbers = false,
            shade_terminals = false,
            start_in_insert = true,
            insert_mappings = true, -- no default mapping
            persist_size = true,
            auto_scroll = true,
            direction = 'horizontal',
            close_on_exit = true,
            shade_terminals = true,
            shell = vim.o.shell,
            float_opts = {
                border = 'curved',
                highlights = {
                    border = 'Normal',
                    background = 'Normal',
                },
            },
            winbar = {
                enabled = true,
            },
        })
        -- Terminal variables
        local Terminal = require("toggleterm.terminal").Terminal
        local terminal = Terminal:new({
            float_opts = { border = "double", },
        })
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = { border = "double", },
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
            end,
            -- function to run on closing the terminal
            on_close = function(term)
                vim.cmd("Closing terminal")
            end,
        })

        function _terminal_toggle()
            terminal:toggle()
        end

        function _lazygit_toggle()
            lazygit:toggle()
        end

        local nnoremap = require("remaps.keymap").nnoremap
        nnoremap("<f2>", "<cmd>lua _terminal_toggle()<CR>", { silent = true })
        nnoremap("<f4>", "<cmd>lua _lazygit_toggle()<CR>", { silent = true })
    end,
}
