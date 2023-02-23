-- TODO: Make this work and load it via lazy as well as install it
return {
    opts = {
        run = function() vim.fn["mkdp#util#install"]() end,
    },
    keys = {
        { "<f10>", "<Plug>MarkdownPreviewToggle" },
    }
}
