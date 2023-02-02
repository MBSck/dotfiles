vim.opt.completeopt = {"menu", "menuone", "noselect"}

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
local luasnip = require("luasnip")

--local select_opts = {"behavior" = cmp.SelectBehavior.Select}

cmp.setup({
    sources = {
        { name = "path", keyword_length = 4},       -- Autcomplets file paths
        { name = "nvim_lsp", keyword_length = 3},   -- Shows suggestions based on the language server
        { name = "luasnip", keyword_length = 2},    -- Shows available snippets
        { name = "buffer", keyword_length = 3},     -- Suggests words found in the current buffer
    },
    window = {
        --completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {
            "menu",             -- Empty by default
            "abbr",             -- Content of the suggestion
            "kind"              -- The type of data
        },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
        item.menu = menu_icon[entry.source.name]
        return item
        end,
    },
    mapping = cmp.mapping.preset.insert {
        -- Autocompletion mapping
        ["<C-p>"] = cmp.mapping.scroll_docs(-4),                    -- Scrolls up in docs
        ["<C-n>"] = cmp.mapping.scroll_docs(4),                     -- Scrolls down in docs

        -- Toggle autocompletion if in word, else move down one word
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),

        -- Toggle autocompletion if in word, else move down one word
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'}),

        ["<C-c>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),                            -- Aborts autcomplete
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Snippet mapping
        -- Jump forward inside snippet
        ["<C-d>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),

        -- Jump back inside snippet
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
    },
    snippet = {
        expand = function(args)
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },
})

-- Auto pairs for completion
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
