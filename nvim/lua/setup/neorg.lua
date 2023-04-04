return {
    setup = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.norg.concealer"] = {},
                ["core.norg.dirman"] = {
                    config = {
                        workspaces = {
                            work = "~/notes/work",
                            personal = "~/notes/personal",
                        }
                    }
                }
            }
        })
    end,

    keys = {
        { "<localleader>nww", ":Neorg workspace work<CR>" },
        { "<localleader>nwp", ":Neorg workspace personal<CR>" },
    }
}
