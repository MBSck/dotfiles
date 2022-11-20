local nnoremap = require("remaps.keymap").nnoremap
local inoremap = require("remaps.keymap").inoremap

-- Insert mode remaps
-- Exit insert mode remap
inoremap("jj", "<esc>", { silent = true })

-- Normal mode remaps
-- Shortcut for faster save
nnoremap("<leader>w", ":update<cr>", { silent = true })

-- Shortcut for save and exit
nnoremap("<leader>q", ":x<cr>", { silent = true })
nnoremap("<leader>w", ":update<cr>", { silent = true })

-- Shortcut for save and exit
nnoremap("<leader>q", ":x<cr>", { silent = true })

-- Line creation shortcut
nnoremap("o", "o<esc>")
nnoremap("O", "O<esc>")

-- Disable arrow keys
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")
nnoremap("<right>", "<nop>")
nnoremap("<left>", "<nop>")
