return {
	-- add pyright to lspconfig
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				pyright = {
					-- settings = {
					--   python = {
					--     pythonPath = vim.fn.getcwd() .. '/.venv/bin/python',
					--   }
					-- }
				},
				julials = {},
			},
		},
	},

	-- add any tools you want to have installed below
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"black",
				"julia-lsp",
			},
		},
	},
}
