vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.history = 1000

vim.opt.termguicolors = true
vim.opt.lazyredraw = true

-- Sets the colorcolumn at 90 characters
vim.opt.colorcolumn = "90"

-- Colorscheme
vim.cmd("colorscheme tokyonight")

-- No-showmode on command line as lualine can show it
--vim.opt.noshowmode
