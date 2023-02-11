local nnoremap = require("remaps.keymap").nnoremap
local builtin = require("telescope.builtin")

require('telescope').load_extension('aerial')
require("telescope").load_extension("notify")
require('telescope').setup({
  extensions = {
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ['_'] = false, -- This key will be the default
        json = true,   -- You can set the option for specific filetypes
        yaml = true,
        python = true,
        rust = true,
      }
    },
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            promt_position = "bottom",
        }
    }
  }
})

nnoremap("<f2>", builtin.find_files)
nnoremap("<leader><f2>", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)
