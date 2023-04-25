return {
  n = {
    -- Easier normal mode
    ["o"] = {"o<Esc>"},
    ["O"] = {"O<Esc>"},
    
  },
  i = {
    -- Exit terminal insert mode
    -- ["<leader>j"] = {"<c-\\><c-n>"},
  },
  v = {
    
    -- Visual mode movement which moves selected text
    ["J"] = {":m '>+1<CR>gv=gv"},
    ["K"] = {":m '<-2<CR>gv=gv"},
  },
}
