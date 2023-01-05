-- This file can be loaded by calling `lua require("plugins")` from your init.lua

-- Only required if you have packer configured as `opt`

return require("packer").startup(function (use)
    -- Packer package manager - Can manage itself
    use 'wbthomason/packer.nvim'

    -- Learning plugin for vim
    use 'ThePrimeagen/vim-be-good'

    -- Visual plugins
    use 'folke/tokyonight.nvim' -- Colorscheme
    use 'Yggdroot/indentLine' -- Better visual support for indentation
    use 'kyazdani42/nvim-web-devicons' -- Icon support
    use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }} -- Lualine
    use 'akinsho/bufferline.nvim' -- Bufferline
    use ('nvim-treesitter/nvim-treesitter', {
        run = ":TSUpdate"
    }) -- Treesitter parsing support
    use 'nvim-treesitter/nvim-treesitter-context' -- Shows function being worked on
    use 'machakann/vim-highlightedyank' -- Highlights the code yanking
    use 'glepnir/dashboard-nvim' -- A fancy dashboard for nvim
    use 'itchyny/vim-highlighturl' -- URL highlighting
    use 'yuttie/comfortable-motion.vim' -- Simulates comfortable scroll motion

    -- Navigation plugins
    use {'nvim-tree/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}} -- File Explorer
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- LSP, Git, Linting and more
    use 'dense-analysis/ale' -- Syntax checking/linting
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use 'airblade/vim-gitgutter' -- Git sideline support

    -- Code Utility Plugins
    use 'jiangmiao/auto-pairs' -- Autopairs brackets
    use 'scrooloose/nerdcommenter' -- Autocomment function that is language specific
    use 'tmhedberg/SimpylFold' -- Better folding for coding
    use 'bronson/vim-trailing-whitespace' -- Quickly removes trailing Whitespace
    use 'mbbill/undotree' -- Undotree

    -- Terminals
    use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
        require("toggleterm").setup()
    end} -- Toggelable term window

    -- Markdown support
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }) -- Markdown preview. Install without yarn or npm

    -- Debugging
    use { "puremourning/vimspector"} -- Graphical debugger
    --use 'mfussenegger/nvim-dap' -- Debugger
    --use 'rcarriga/nvim-dap-ui' -- Better interface for debugger
    --use 'theHamsta/nvim-dap-virtual-text' -- Virtual text for debugger
end)
