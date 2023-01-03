local nnoremap = require("remaps.keymap").nnoremap
local nmap = require("remaps.keymap").nmap

-- General plugin remaps
nmap("<f1>", vim.cmd.UndotreeToggle)
nnoremap("<f3>", ":NvimTreeToggle<cr>")
nnoremap("<f4>", ":w<CR><cmd>lua _pytest_toggle()<CR>", { silent = true })
nnoremap("<f5>", ":w <CR><cmd>lua _python_toggle()<CR>", { silent = true })
nnoremap("<leader><f5>", ":w <CR><cmd>lua _python_package_toggle()<CR>", { silent = true })
nnoremap("<f6>", ":w <CR><cmd>lua  _rust_cargo_run_toggle()<CR>", { silent = true })
nnoremap("<f8>", "<cmd>lua _lazygit_toggle()<CR>", { silent = true })
nnoremap("<f7>", ":FixWhitespace<cr>")
nnoremap("<f9>", "<cmd>lua _terminal_toggle()<CR>", { silent = true })
