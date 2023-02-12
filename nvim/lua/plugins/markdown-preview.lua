return {
    "iamcco/markdown-preview.nvim",
    opts = {
        run = function() vim.fn["mkdp#util#install"]() end,
    },
    keys = {
        { "<f10>", "<Plug>MarkdownPreviewToggle" },
    }
}