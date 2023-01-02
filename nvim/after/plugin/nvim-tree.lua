local nnoremap = require("remaps.keymap").nnoremap

-- Tip: To show help for all commands in nvim-tree use g?
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  --open_on_setup = true,
  --open_on_setup_file = true,
  --open_on_tab = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Automatically closes NvimTree if it is the last window in a tab
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

nnoremap("<f3>", ":NvimTreeToggle<cr>")
