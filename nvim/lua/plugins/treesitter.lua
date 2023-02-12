return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = require('setup.treesitter').setup,
}
