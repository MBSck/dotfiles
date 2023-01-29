-- This file can be loaded by calling `lua require("plugins")` from your init.lua

-- Only required if you have packer configured as `opt`

return require("packer").startup(function (use)
    -- Packer package manager - Can manage itself
    use 'wbthomason/packer.nvim'

    -- Learning plugin for vim. From PRIMAGEAN
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
    use {
        "nvim-zh/colorful-winsep.nvim",
        config = function ()
            require('colorful-winsep').setup()
        end
    } -- Colorful window separation to see what window is active

    -- Navigation plugins
    use {'nvim-tree/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}} -- File Explorer
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- LSP support
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'WhoIsSethDaniel/mason-tool-installer.nvim'}

    -- Autocompletion
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-nvim-lua'}
            -- Autocompletion

    -- Snippets
    use {'L3MON4D3/LuaSnip'}
    use {'rafamadriz/friendly-snippets'}

    -- Git support
    use 'airblade/vim-gitgutter' -- Git sideline support

    -- Github copilot like tool
    use {
      'Exafunction/codeium.vim',
      config = function ()
        -- Change '<C-g>' here to any keycode you like.
        vim.keymap.set('i', '<C-g>', function ()
          return vim.fn['codeium#Accept']()
        end, { expr = true })
      end
    }

    -- Code Utility Plugins
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    } -- Autopairs brackets
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

    -- Latex support
    use {
        'lervag/vimtex',
        opt = true,
        config = function ()
            vim.g.vimtex_view_general_viewer = 'okular'
            vim.g.vimtex_compiler_latexmk_engines = {
                _ = '-xelatex'
            }
            vim.g.tex_comment_nospell = 1
            vim.g.vimtex_compiler_progname = 'nvr'
            vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
            vim.g.vimtex_view_general_options_latexmk = '--unique'
        end,
        ft = 'tex'
    }

    -- Debugging
    use { "puremourning/vimspector"} -- Graphical debugger
    --use 'mfussenegger/nvim-dap' -- Debugger
    --use 'rcarriga/nvim-dap-ui' -- Better interface for debugger
    --use 'theHamsta/nvim-dap-virtual-text' -- Virtual text for debugger
end)
