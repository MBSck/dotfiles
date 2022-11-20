local nnoremap = require("keymap").nnoremap

-- Plugin remaps
-- FZF plugin
nnoremap("<f2>", ":FZF<cr>")
nnoremap("<c-f>", ":Files<cr>", { silent = true })
nnoremap("<leader>f", ":Rg<cr>", { silent = true })

-- Fix Whitespace
nnoremap("<f7>", ":FixWhitespace<cr>")
