return {
    init = function ()
        vim.keymap.set("n", "<leader>db", function()
            require("dap").toggle_breakpoint()
        end, { desc = "Toggle Breakpoint" })

        vim.keymap.set("n", "<leader>dc", function()
            require("dap").continue()
        end, { desc = "Continue" })

        vim.keymap.set("n", "<leader>do", function()
            require("dap").step_over()
        end, { desc = "Step Over" })

        vim.keymap.set("n", "<leader>di", function()
            require("dap").step_into()
        end, { desc = "Step Into" })

        vim.keymap.set("n", "<leader>dw", function()
            require("dap.ui.widgets").hover()
        end, { desc = "Widgets" })

        vim.keymap.set("n", "<leader>dr", function()
            require("dap").repl.open()
        end, { desc = "Repl" })

        vim.keymap.set("n", "<leader>du", function()
            require("dapui").toggle({})
        end, { desc = "Dap UI" })

        vim.keymap.set("n", "<leader>ds", function()
            require("osv").launch({ port = 8086 })
        end, { desc = "Launch Lua Debugger Server" })

        vim.keymap.set("n", "<leader>dd", function()
            require("osv").run_this()
        end, { desc = "Launch Lua Debugger" })
    end,

    setup = function()
        local dap = require("dap")

        -- Rust/C++ debugging adapter
        dap.adapters.lldb = {
            type = 'executable',
            command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
            name = 'lldb'
        }

        -- Lua debugging adapter
        dap.adapters.nlua = function(callback, config)
            callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
        end

        -- Python debugging adapter and configuration
        require('dap-python').setup('~/.pyenv/versions/3.11.0/envs/debugpy/bin/python')

        -- Lua debugging configuration
        dap.configurations.lua = {
            {
                type = "nlua",
                request = "attach",
                name = "Attach to running Neovim instance",
            }
        }

        -- Rust debugging configuration
        dap.configurations.rust = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        }

        -- UI configuration for dap
        local dapui = require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
        end

        require("nvim-dap-virtual-text").setup {
            enabled = true,                        -- enable this plugin (the default)
            enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
            highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true,               -- show stop reason when stopped for exceptions
            commented = false,                     -- prefix virtual text with comment string
            only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
            all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
            --- A callback that determines how a variable is displayed or whether it should be omitted
            --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
            --- @param buf number
            --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
            --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
            --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
            display_callback = function(variable, _buf, _stackframe, _node)
                return variable.name .. ' = ' .. variable.value
            end,

            -- experimental features:
            virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
            all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
            virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
            virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
            -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
        }
    end
}
