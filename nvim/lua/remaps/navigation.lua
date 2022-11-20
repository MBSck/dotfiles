local nnoremap = require("keymap").nnoremap

-- Move by visual line
nnoremap("j", "gj")
nnoremap("k", "gk")

-- Split navigation
nnoremap("<c-j>", "<c-w><c-j>")
nnoremap("<c-k>", "<c-w><c-k>")
nnoremap("<c-l>", "<c-w><c-l>")
nnoremap("<c-h>", "<c-w><c-h>")

