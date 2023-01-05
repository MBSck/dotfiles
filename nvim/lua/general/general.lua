-- Set encoding to utf-8
vim.cmd("set encoding=utf-8")

-- Set language support
vim.cmd("set spelllang=en_gb")

-- Avoid language server issues with backup-files
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer update-time leads to delays
vim.opt.updatetime = 300

-- Set clipboard
vim.cmd("set clipboard=unnamed")

-- Always show signalcolumn, otherwise it would shift text if diagnostics come up
vim.opt.signcolumn = "yes"

-- Disable netrw at the very start of the init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable filetype -> Vim will try to detect the filetype
vim.g.do_filetype_lua = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- General undo settings
vim.opt.scrolloff = 3
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile = true

-- Leader
vim.g.mapleader = ","

-- File settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 90
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.fileformat = "unix"

-- Disblae python support and enable python3 support for neovim
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/Users/scheuck/.pyenv/shims/python3"

-- Set python3 version to standard version for evaluation within nvim
vim.cmd("set pyxversion=3")
