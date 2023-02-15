return {
    -- Overides the default vim notify method for a floating window
    { 'rcarriga/nvim-notify', config = { require("setup.notify").setup } },
    -- Status progress for lsp servers
    { 'j-hui/fidget.nvim', config = require('setup.fidget').setup },
    -- Status line
    {
    'nvim-lualine/lualine.nvim',
    event = "UIEnter",
    config = function()
        require("setup.lualine").setup(
            require("setup.lsp_signature").status_line,
            require("setup.nvim-navic").winbar
        )
    end,
    },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      opts = { style = "moon" },
      priority = 1000,
      config = function()
          -- load the colorscheme here
          vim.cmd([[colorscheme tokyonight]])
      end,
    },
}