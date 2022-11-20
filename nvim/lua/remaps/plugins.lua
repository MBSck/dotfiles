local nnoremap = require("remaps.keymap").nnoremap
--local terminal = require("terminal").pytest_toggle


-- Plugin remaps
-- FZF plugin
nnoremap("<f2>", ":FZF<cr>")
nnoremap("<c-f>", ":Files<cr>", { silent = true })
nnoremap("<leader>f", ":Rg<cr>", { silent = true })

-- Toggleterm
--nnoremap("<f4>", ":w<CR><cmd>lua pytest_toggle()<CR>", { silent = true })
--nnoremap("<f5>", ":w <CR><cmd>lua terminal._python_toggle()<CR>", { silent = true })
--nnoremap("<leader><f5>", ":w <CR><cmd>lua terminal._python_package_toggle()<CR>", { silent = true })
--nnoremap("<f6>", ":w <CR><cmd>lua  terminal._rust_cargo_run_toggle()<CR>", { silent = true })
--nnoremap("<f8>", "<cmd>lua terminal._lazygit_toggle()<CR>", { silent = true })
--nnoremap("<f9>", "<cmd>lua terminal._terminal_toggle()<CR>", { silent = true })

-- Fix Whitespace
nnoremap("<f7>", ":FixWhitespace<cr>")

