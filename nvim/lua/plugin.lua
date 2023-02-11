-- Only required if you have packer configured as `opt`
vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Let packer manage packer
    use 'wbthomason/packer.nvim'

    -- Learning plugin for vim. From PRIMAGEAN
    use 'ThePrimeagen/vim-be-good'

    -- Visual plugins
    use 'folke/tokyonight.nvim'                        -- Colorscheme
    use 'Yggdroot/indentLine'                          -- Better visual support for indentation
    use 'kyazdani42/nvim-web-devicons'                 -- Icon support
    use 'nvim-lualine/lualine.nvim'                    -- Lualine
    use 'akinsho/bufferline.nvim'                      -- Bufferline
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    } -- Treesitter parsing support
    use 'machakann/vim-highlightedyank'                -- Highlights the code yanking
    use 'glepnir/dashboard-nvim'                       -- A fancy dashboard for nvim
    use 'itchyny/vim-highlighturl'                     -- URL highlighting
    use 'yuttie/comfortable-motion.vim'                -- Simulates comfortable scroll motion
    use {
        "nvim-zh/colorful-winsep.nvim",
        config = function ()
            require('colorful-winsep').setup()
        end
    } -- Colorful window separation to see what window is active
    use 'rcarriga/nvim-notify' -- Notify

    -- Navigation plugins
    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    } -- File Explorer
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = 'nvim-lua/plenary.nvim'
    } -- Requires BurntSushi/ripgrep as a grep dependency
    use {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end
    }
     -- Shows where one is at the top of the file

    -- LSP support
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'WhoIsSethDaniel/mason-tool-installer.nvim'

    -- Snippets
    use {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    }
    use 'rafamadriz/friendly-snippets'     -- Collection of user-defined snippets

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'              -- Autocompletion
    use 'hrsh7th/cmp-path'              -- Autocompletion for Path
    use 'hrsh7th/cmp-buffer'            -- Autocompletion for Buffer
    use 'hrsh7th/cmp-cmdline'           -- Autocompletion for cmdline
    use 'hrsh7th/cmp-nvim-lsp'          -- Autocompletion for LSP
    use 'hrsh7th/cmp-nvim-lua'          -- Autcompletion for lua
    use 'saadparwaiz1/cmp_luasnip'      -- Autocompletion for luasnip

    -- Commenting
    use 'scrooloose/nerdcommenter'      -- Autocomment function that is language specific
    use {
        'folke/todo-comments.nvim',
        requires = "nvim-lua/plenary.nvim"
    }                                  -- Highlights TO-DO comments and similar. And adds search tools

    -- Git support
    use 'airblade/vim-gitgutter' -- Git sideline support

    -- Github copilot like tool
    use 'Exafunction/codeium.vim'

    -- Code Utility Plugins
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }                                               -- Autopairs brackets
    use 'tmhedberg/SimpylFold'                      -- Better folding for coding
    use 'ntpeters/vim-better-whitespace'            -- Better whitespace
    use 'mbbill/undotree'                           -- Undotree
    use {"akinsho/toggleterm.nvim", tag = '*'}      -- Toggleterm

    -- Markdown support
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    } -- Markdown preview

    -- Latex support
    use {
        'lervag/vimtex', opt = true, ft = 'tex'
    }
end)
