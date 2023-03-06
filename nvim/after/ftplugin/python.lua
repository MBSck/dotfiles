local vo = vim.opt_local

-- Show line after desired maximum text width
vo.colorcolumn = "90"
vo.textwidth = 90

-- Settings for python
vo.tabstop = 4              -- number of visual spaces per TAB
vo.wrap = true              -- wrap long lines
vo.softtabstop = 4          -- Number of spaces in tab when editing
vo.shiftwidth = 4           -- Number of spaces to use for autoindent
vo.expandtab = true         -- Expand tab to spaces so that tabs are spaces
vo.autoindent = true        -- Autodindentation
vo.sidescroll = 5           -- Sidescroll if wrap is off (horizontal)
vo.sidescrolloff = 2        -- Words off the screen displayed if wrap is off (horizontal)

-- Proper Python indent settings
vim.g.pyindent_open_paren = 'shiftwidth()'
vim.g.pyindent_nested_paren = 'shiftwidth()'
vim.g.pyindent_continue = 'shiftwidth()'
vim.g.pyindent_close_paren = '-shiftwidth()'
