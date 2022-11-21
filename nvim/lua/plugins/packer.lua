-- This file can be loaded by calling `lua require("plugins")` from your init.lua

-- Only required if you have packer configured as `opt`

return require("packer").startup(function (use)
	-- Packer package manager - Can manage itself
	use 'wbthomason/packer.nvim'

	-- Visual plugins
    use 'folke/tokyonight.nvim' -- Colorscheme
	use 'Yggdroot/indentLine' -- Better visual support for indentation
    use 'kyazdani42/nvim-web-devicons' -- Icon support
    use {'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}, opt = true} -- Lualine
    use 'akinsho/bufferline.nvim' -- Bufferline
	use 'nvim-treesitter/nvim-treesitter' -- Treesitter parsing support
	use 'machakann/vim-highlightedyank' -- Highlights the code yanking
    use 'glepnir/dashboard-nvim' -- A fancy dashboard for nvim
	use 'itchyny/vim-highlighturl' -- URL highlighting
	use 'yuttie/comfortable-motion.vim' -- Simulates comfortable scroll motion

	-- Navigation plugins
    use {'nvim-tree/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}} -- File Explorer
	use 'junegunn/fzf.vim' -- Fuzzy file finder
	use {'junegunn/fzf', run = ":call fzf#install()"} -- Updates the FZF

	-- LSP, Git, Linting and more
	use 'dense-analysis/ale' -- Syntax checking/linting
	use {'neoclide/coc.nvim', branch = 'release'} -- Language server autocompletion
    use 'folke/trouble.nvim' -- Pretty list of LSP Error message support
	use 'airblade/vim-gitgutter' -- Git sideline support

	-- Code Utility Plugins
	use 'cryopie/vim-tabular' -- Tabular alignment
	use 'bronson/vim-trailing-whitespace' -- Quickly removes trailing Whitespace
	use 'jiangmiao/auto-pairs' -- Autopairs brackets
	use 'tmhedberg/SimpylFold' -- Better folding for coding
	use 'scrooloose/nerdcommenter' -- Autocomment function that is language specific
	use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
		require("toggleterm").setup()
	end} -- Toggelable term window
    use 'puremourning/vimspector' -- Debugger for VIM
	use 'Vimjas/vim-python-pep8-indent' -- Automatic indent for python Pep8
end)
