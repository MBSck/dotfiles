-- Visual.
vim.opt.relativenumber = true -- relative line numbers

-- Text Highlights
require("user.treesitter").setup()

-- Keybindings
require("user.keybindings").setup()

-- Whichkey
require("user.whichkey").setup()

-- Plugins
require("user.plugins").setup()
