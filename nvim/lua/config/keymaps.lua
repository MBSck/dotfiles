local keymaps  = require("config.utils").keymaps
local nnoremap = keymaps.nnoremap
local inoremap = keymaps.inoremap
local tnoremap = keymaps.tnoremap
local vnoremap = keymaps.vnoremap
local xnoremap = keymaps.xnoremap

-- General
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

-- Navigation
-- Simple folding
nnoremap("<space>", "za")

-- Move by visual line
nnoremap("j", "gj")
nnoremap("k", "gk")

-- Split navigation
nnoremap("<c-j>", "<c-w><c-j>")
nnoremap("<c-k>", "<c-w><c-k>")
nnoremap("<c-l>", "<c-w><c-l>")
nnoremap("<c-h>", "<c-w><c-h>")

-- Easier tab handling
nnoremap("<leader>tn", ":tabnew<cr>")
nnoremap("<leader>t<leader>", ":tabnext<cr>")
nnoremap("<leader>tm", ":tabmove")
nnoremap("<leader>tc", ":tabclose<cr>")
nnoremap("<leader>to", ":tabonly<cr>")

-- Tab switching
nnoremap("<leader>1", "1gt<cr>")
nnoremap("<leader>2", "2gt<cr>")
nnoremap("<leader>3", "3gt<cr>")
nnoremap("<leader>4", "4gt<cr>")
nnoremap("<leader>5", "5gt<cr>")
nnoremap("<leader>6", "6gt<cr>")
nnoremap("<leader>7", "7gt<cr>")
nnoremap("<leader>8", "8gt<cr>")
nnoremap("<leader>9", "9gt<cr>")
nnoremap("<leader>0", "0gt<cr>")

-- Fast tab switching
nnoremap("H", ":tabprevious<cr>")
nnoremap("L", ":tabnext<cr>")

-- Buffer switching
nnoremap("<leader>b1", ":buffer1<cr>")
nnoremap("<leader>b2", ":buffer2<cr>")
nnoremap("<leader>b3", ":buffer3<cr>")
nnoremap("<leader>b4", ":buffer4<cr>")
nnoremap("<leader>b5", ":buffer5<cr>")
nnoremap("<leader>b6", ":buffer6<cr>")
nnoremap("<leader>b7", ":buffer7<cr>")
nnoremap("<leader>b8", ":buffer8<cr>")
nnoremap("<leader>b9", ":buffer9<cr>")
nnoremap("<leader>b0", ":buffer0<cr>")

-- Fast buffer switching
nnoremap("<leader>b", ":buffers<cr>:buffer<space>")
nnoremap("<leader>bd", ":bdelete<cr>")
nnoremap("<leader>bn", ":bnext<cr>")
nnoremap("<leader>bp", ":bprev<cr>")

-- Search
nnoremap("<leader><space>", ":nohlsearch<cr>")
