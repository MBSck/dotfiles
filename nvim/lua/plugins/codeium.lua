-- Github copilot like tool
{
    'Exafunction/codeium.vim',
    opts = {
        codeium_disable_bindings = 1
    }
    keys = {
        { "<c-x>", function() return vim.fn['codeium#Clear']() end, { expr = true } },
        { "<C-;>", function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true } },
        { "<C-,>", function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true } },
        { "<C-g>", function() return vim.fn['codeium#Accept']() end, { expr = true } },
    }
}
