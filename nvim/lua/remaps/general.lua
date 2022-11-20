local nnoremap = require("keymap").nnoremap
local inoremap = require("keymap").inoremap

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

