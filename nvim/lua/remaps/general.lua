local nmap = require("remaps.keymap").nmap
local nnoremap = require("remaps.keymap").nnoremap
local inoremap = require("remaps.keymap").inoremap
local tnoremap = require("remaps.keymap").tnoremap
local vnoremap = require("remaps.keymap").vnoremap
local xnoremap = require("remaps.keymap").xnoremap

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

-- Visual mode movement which moves selected text
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Makes cursor stay where it is while appending lines
nnoremap("J", "mzJ`z")

-- Makes search terms stay in the middle
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- If copied in this way, then previously buffered string remains in buffer
xnoremap("<leader>p", "\"_dP")

-- Copy and pasting from within to without vim
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "\"+Y")

-- If deleted in this way, then it does not get pasted into the buffer
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- Quickfix list navigation
--nnoremap("<C-k>", "<cmd>cnext<CR>zz")
--nnoremap("<C-j>", "<cmd>cprev<CR>zz")
--nnoremap("<leader>k", "<cmd>lnext<CR>zz")
--nnoremap("<leader>j", "<cmd>lprev<CR>zz")

-- Replaces the word selected
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
