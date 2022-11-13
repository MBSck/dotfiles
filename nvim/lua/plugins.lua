-- This file can be loaded by calling `lua require("plugins")` from your init.lua

-- Only required if you have packer configured as `opt`

return require("packer").startup(function (use)
	-- Packer package manager - Can manage itself
	use 'wbthomason/packer.nvim'

	-- Visual plugins
	use 'morhetz/gruvbox' -- Better gruvbox Better gruvbox
	use 'Yggdroot/indentLine' -- Better visual support for indentation
	use 'vim-airline/vim-airline' -- More support for the powerline
	use 'vim-airline/vim-airline-themes' -- Themes for the vim-airline
	use 'nvim-treesitter/nvim-treesitter' -- Treesitter parsing support
	use 'machakann/vim-highlightedyank' -- Highlights the code yanking
	use 'mhinz/vim-startify' -- A fancy start screen
	use 'itchyny/vim-highlighturl' -- URL highlighting
	use 'yuttie/comfortable-motion.vim' -- Simulates comfortable scroll motion

	-- Navigation plugins
	use 'preservim/nerdtree' -- File system explorer
	use 'Xuyuanp/nerdtree-git-plugin' -- NERDTree git implementation
	use 'tiagofumo/vim-nerdtree-syntax-highlight' -- NERDTree Syntax highlight
	use 'ryanoasis/vim-devicons' -- Icon support, needs Nerd-font installed
	use 'junegunn/fzf.vim' -- Fuzzy file finder
	use {'junegunn/fzf', run = ":call fzf#install()"} -- Updates the FZF

	-- Linting
	use 'dense-analysis/ale' -- Syntax checking/linting

	-- Code Utility Plugins
	use 'cryopie/vim-tabular' -- Tabular alignment
	use 'bronson/vim-trailing-whitespace' -- Quickly removes trailing Whitespace
	use 'airblade/vim-gitgutter' -- Git sideline support
	use 'jiangmiao/auto-pairs' -- Autopairs brackets
	use 'tmhedberg/SimpylFold' -- Better folding for coding
	use 'scrooloose/nerdcommenter' -- Autocomment function that is language specific
	use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
		require("toggleterm").setup()
	end} -- Toggelable term window
	use {'neoclide/coc.nvim', branch = 'release'} -- Language server autocompletion
	use 'puremourning/vimspector' -- Debugger for VIM
	use 'Vimjas/vim-python-pep8-indent' -- Automatic indent for python Pep8
end)
