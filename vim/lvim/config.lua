-- General
require("user.general").setup()

-- Text Highlights
require("user.treesitter").setup()

-- Keybindings
require("user.keybindings").setup()

-- Whichkey
require("user.whichkey").setup()

-- Plugins
require("user.plugins").setup()

-- LSP
require("user.lsp.cpp").setup()
require("user.lsp.python").setup()
