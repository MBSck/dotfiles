local inoremap = require("remaps.keymap").inoremap

vim.g.codeium_disable_bindings = 1

inoremap("<c-x>", function() return vim.fn['codeium#Clear']() end, { expr = true })
inoremap("<C-;>", function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
inoremap("<C-,>", function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
inoremap("<C-g>", function() return vim.fn['codeium#Accept']() end, { expr = true })
