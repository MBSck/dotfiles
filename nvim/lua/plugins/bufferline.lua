local icons = require("config.icons")

return {
    'akinsho/bufferline.nvim',
    opts = {
        options = {
            mode = "tabs", -- set to "tabs" to only show tabpages instead
            numbers = "both",
            close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            indicator = {
                icon = icons.bufferline.indicator, -- this should be omitted if indicator style is not 'icon'
                style = 'icon',
            },
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 18,
            color_icons = true, -- whether or not to add the filetype icon highlights
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = false,
            show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
            show_close_icon = false,
            show_tab_indicators = true,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            always_show_bufferline = true,
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
            -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return "("..count..")"
            end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                }
            },
        }
    }
}
