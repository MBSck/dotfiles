local nnoremap = require("remaps.keymap").nnoremap

-- Scientific PDF viewer
vim.g.vimtex_view_general_viewer = 'okular'

vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk_engines = {_ = '-xelatex'}
vim.g.tex_comment_nospell = 1
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
vim.g.vimtex_view_general_options_latexmk = '--unique'
vim.g.vimtex_quickfix_open_on_warning = 0

-- Movement
nnoremap("<localleader>k", "m[")
nnoremap("<localleader>j", "m]")
nnoremap("<localleader>p", "[[")
nnoremap("<localleader>n", "]]")

-- Actions
nnoremap("dsm", "<Plug>(vimtex-env-delete-math)")
nnoremap("csm", "<Plug>(vimtex-env-change-math)")
nnoremap("tsm", "<Plug>(vimtex-env-toggle-math)")

-- Local Remaps
nnoremap("<localleader><f1>", "<plug>(vimtex-env-surround-line)")
nnoremap("<localleader><f1>", "<plug>(vimtex-env-surround-operator)")
nnoremap("<localleader><f1>", "<plug>(vimtex-env-surround-visual)")
nnoremap("<localleader><f2>", "<plug>(vimtex-cmd-create)")
nnoremap("<localleader><f3>", "<plug>(vimtex-delim-add-modifiers)")
