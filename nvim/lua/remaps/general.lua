local nnoremap = require("remaps.keymap").nnoremap
local inoremap = require("remaps.keymap").inoremap
local tnoremap = require("remaps.keymap").tnoremap

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

-- TODO: Add this -- Add space after and before

-- Opens a new tab with a terminal
nnoremap("<leader>tt", ":tab new <cr>:tab term<cr>")

-- Exit terminal insert mode
tnoremap("<leader>j", "<c-\\><c-n>")
