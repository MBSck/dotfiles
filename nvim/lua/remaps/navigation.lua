local nnoremap = require("keymap").nnoremap

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
nnoremap("<leader>hn", ":bnext<cr>")
nnoremap("<leader>bp", ":bprev<cr>")

