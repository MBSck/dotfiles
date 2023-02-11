{
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',          -- Autocompletion for LSP
    'hrsh7th/cmp-buffer',            -- Autocompletion for Buffer
    'hrsh7th/cmp-path',              -- Autocompletion for Path
    'hrsh7th/cmp-cmdline',           -- Autocompletion for cmdline
    'hrsh7th/cmp-nvim-lua',          -- Autcompletion for lua
    'saadparwaiz1/cmp_luasnip',      -- Autocompletion for luasnip
  },
  opts = function()
      local cmp = require("cmp")
      return {
          completion = {
              completeopt = "menu, menuone, noinsert",
          },
          snippet = {
              expand = function(args)
                  require("luasnip").lsp_expand(args.body)
              end,
          },
          window = {
              --completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
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
          }),
          sources = cmp.config.sources({
              { name = "nvim_lsp", keyword_length = 3},   -- Shows suggestions based on the language server
              { name = "luasnip", keyword_length = 2},    -- Shows available snippets
              { name = "buffer", keyword_length = 3},     -- Suggests words found in the current buffer
              { name = "path", keyword_length = 4},       -- Autcomplets file paths
          }),
          formatting = {
              format = function(_, item)
                  local icons = require("config.icons").cmp.kinds
                  if icons[item.kind] then
                      item.kind = icons[item.kind] .. item.kind
                  end
                  return item
              end,
          },
          experimental = {
              ghost_text = {
                  hl_group = "LspCodeLens",
              },
          },
      }
  end,
}

-- Auto pairs for completion
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
