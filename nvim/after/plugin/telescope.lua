local nnoremap = require("remaps.keymap").nnoremap
local builtin = require("telescope.builtin")

nnoremap("<f2>", builtin.find_files)
nnoremap("<leader><f2>", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)
