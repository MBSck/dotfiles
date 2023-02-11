local nnoremap = require("remaps.keymap").nnoremap

vim.g.better_whitespace_enabled=0
vim.g.strip_whitespace_on_save=0

nnoremap("<leader><f7>", ":StripWhitespace<cr>")
nnoremap("<f7>", ":ToggleWhitespace<cr>")
