local nnoremap = require("remaps.keymap").nnoremap

{
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
}

    -- Markdown support

nnoremap("<f10>", "<Plug>MarkdownPreviewToggle")
