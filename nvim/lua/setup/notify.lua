return {
    setup = function()
        require('notify').setup({
            -- Default timeout for notifications
            timeout = 1500,
            -- Animation style
            stages = 'fade_in_slide_out',
            background_colour = "#2E3440",
        })
        -- overrides vim notification method
        vim.notify = require('notify')
    end,
}
