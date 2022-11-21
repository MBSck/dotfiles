local nnoremap = require("remaps.keymap").nnoremap

nnoremap("<f2>", ":FZF<cr>")
nnoremap("<c-f>", ":Files<cr>", { silent = true })
nnoremap("<leader>f", ":Rg<cr>", { silent = true })
