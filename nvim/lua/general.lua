-- Disable netrw at the very start of the init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable filetype -> Vim will try to detect the filetype
vim.g.do_filetype_lua = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

--vim.opt.errorbells = false

vim.opt.scrolloff = 3
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile = true

vim.g.mapleader = ","
