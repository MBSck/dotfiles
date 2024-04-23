return {
	colorscheme = "tokyonight",
  lsp = {
    -- customize lsp formatting options
    formatting = {
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
        },
      },
    },
  },
}
