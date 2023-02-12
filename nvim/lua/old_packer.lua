return require('packer').startup(function(use)

    -- Learning plugin for vim. From PRIMAGEAN
    use 'ThePrimeagen/vim-be-good'

    -- Visual plugins
    use 'folke/tokyonight.nvim'                        -- Colorscheme
    use 'Yggdroot/indentLine'                          -- Better visual support for indentation
    use 'kyazdani42/nvim-web-devicons'                 -- Icon support
    use 'machakann/vim-highlightedyank'                -- Highlights the code yanking
    use 'itchyny/vim-highlighturl'                     -- URL highlighting
    use 'yuttie/comfortable-motion.vim'                -- Simulates comfortable scroll motion
    use {
        "nvim-zh/colorful-winsep.nvim",
        config = function ()
            require('colorful-winsep').setup()
        end
    } -- Colorful window separation to see what window is active

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = 'nvim-lua/plenary.nvim'
    } -- Requires BurntSushi/ripgrep as a grep dependency

    -- Commenting
    use {
        'folke/todo-comments.nvim',
        requires = "nvim-lua/plenary.nvim"
    }                                  -- Highlights TO-DO comments and similar. And adds search tools


    -- Code Utility Plugins
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }                                               -- Autopairs brackets
    use 'tmhedberg/SimpylFold'                      -- Better folding for coding


    -- Latex support
    use {
        'lervag/vimtex', opt = true, ft = 'tex'
    }
end)

