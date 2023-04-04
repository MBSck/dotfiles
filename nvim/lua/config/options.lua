-- Disable netrw at the very start of the init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set encoding to utf-8
vim.opt.encoding = "utf-8"

-- Set language support
vim.opt.spelllang = "en_gb"

-- Having longer update-time leads to delays
vim.opt.updatetime = 300

-- Set clipboard
vim.opt.clipboard = "unnamed"

-- Always show signalcolumn, otherwise it would shift text if diagnostics come up
vim.opt.signcolumn = "yes"

-- Enable filetype -> Neovim will try to detect the filetype
vim.g.do_filetype_lua = true

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Avoid language server issues with backup-files
vim.opt.backup = false
vim.opt.writebackup = false

-- General undo settings
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile = true

-- File settings
vim.opt.fileformat = "unix"

-- Set python3 version to standard version for evaluation within nvim
vim.opt.pyxversion = 3

-- Disable python support and enable python3 support for neovim
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/Users/scheuck/.pyenv/shims/python3"

-- General Layout for splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 10   -- Opens most fold by default
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 10      -- 10 nested fold max shown from start

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.history = 1000

-- Visual
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.lazyredraw = true

-- No-showmode on command line as lualine can show it
--vim.opt.noshowmode

-- Wildmenu
vim.opt.wildignore = {"*.docx", "*.jpg", "*.png", "*.gif", "*.pdf", "*.pyc", "*.exe", "*.flv", "*.img", "*.xlsx"}
