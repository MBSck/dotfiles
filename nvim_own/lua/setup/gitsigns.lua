return {
    setup = function()
        -- TODO: Use the gitsigns colors for the lualine as well and remove whitespace
        -- around lualine as well
        local assets = require("config.assets")
        local colors = assets.colors()
        local icons = assets.icons
        require("gitsigns").setup({
            signs = {
                add = { text = icons.git.add, hl = colors.git_add },
                change = { text = icons.git.change, hl = colors.git_change },
                delete = { text = icons.git.delete, hl = colors.git_delete },
                topdelete = { text = icons.git.top_delete, hl = colors.git_delete },
                changedelete = { text = icons.git.change_delete, hl = colors.git_change },
                untracked = { text = icons.git.untrack, hl = colors.git_add },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = require("config.utils").functions.map
                -- stylua: ignore start
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
                map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
                map("n", "<leader>ghd", gs.diffthis, "Diff This")
                map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
            end,
        })
        require("scrollbar.handlers.gitsigns").setup()
    end,
}
