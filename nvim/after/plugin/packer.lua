-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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

    -- Navigation plugins
    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    } -- File Explorer
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = 'nvim-lua/plenary.nvim'
    }
    use({
      "utilyre/barbecue.nvim",
      tag = "*",
      requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      after = "nvim-web-devicons", -- keep this if you're using NvChad
      config = function()
        require("barbecue").setup()
      end,
    }) -- Shows where one is at the top of the file

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
    use 'hrsh7th/nvim-cmp'            -- Autocompletion
    use 'hrsh7th/cmp-path'            -- Autocompletion for Path
    use 'hrsh7th/cmp-buffer'          -- Autocompletion for Buffer
    use 'hrsh7th/cmp-cmdline'         -- Autocompletion for cmdline
    use 'hrsh7th/cmp-nvim-lsp'        -- Autocompletion for LSP
    use 'hrsh7th/cmp-nvim-lua'        -- Autcompletion for lua
    use 'saadparwaiz1/cmp_luasnip'    -- Autocompletion for luasnip

    -- Git support
    use 'airblade/vim-gitgutter' -- Git sideline support

    -- Github copilot like tool
    use 'Exafunction/codeium.vim'

    -- Code Utility Plugins
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }                                          -- Autopairs brackets
    use 'scrooloose/nerdcommenter'             -- Autocomment function that is language specific
    use 'tmhedberg/SimpylFold'                 -- Better folding for coding
    use 'bronson/vim-trailing-whitespace'      -- Quickly removes trailing Whitespace
    use 'mbbill/undotree'                      -- Undotree
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}                                       -- Toggleterm

    -- Markdown support
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    } -- Markdown preview. Install without yarn or npm

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
end)
