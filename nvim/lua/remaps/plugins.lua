local nnoremap = require("remaps.keymap").nnoremap
--local terminal = require("terminal").pytest_toggle


-- Plugin remaps
-- FZF plugin
nnoremap("<f2>", ":FZF<cr>")
nnoremap("<c-f>", ":Files<cr>", { silent = true })
nnoremap("<leader>f", ":Rg<cr>", { silent = true })

-- Toggleterm

-- Fix Whitespace
nnoremap("<f7>", ":FixWhitespace<cr>")

