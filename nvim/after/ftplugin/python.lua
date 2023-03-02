local vo = vim.opt_local

-- Show line after desired maximum text width
vo.colorcolumn = "90"
vo.textwidth = 90

-- Settings for python
vo.tabstop = 4             -- number of visual spaces per TAB
vo.softtabstop = 4         -- number of spaces in tab when editing
vo.shiftwidth = 4          -- number of spaces to use for autoindent
vo.expandtab = true        -- expand tab to spaces so that tabs are spaces
vo.autoindent = true

-- vim.opt.sidescroll = 5
-- vim.opt.sidescrolloff = 2
