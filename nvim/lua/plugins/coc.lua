local inoremap = require("remaps.keymap").inoremap
local nnoremap = require("remaps.keymap").nnoremap

-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Remaps
-- Use tab for trigger completion with characters ahead and navigate.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
inoremap("<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
inoremap("<SHIFT-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
inoremap("<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion -> Check what this does
inoremap("<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Diagonstics
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap("[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
nnoremap("]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
nnoremap("gd", "<Plug>(coc-definition)", {silent = true})
nnoremap("gy", "<Plug>(coc-type-definition)", {silent = true})
nnoremap("gi", "<Plug>(coc-implementation)", {silent = true})
nnoremap("gr", "<Plug>(coc-references)", {silent = true})

-- Function to show documentation in preview windows
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- Use K to show documentation in preview window.
nnoremap("K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming.
nnoremap("<leader>rn", "<Plug>(coc-rename)", {silent = true})
