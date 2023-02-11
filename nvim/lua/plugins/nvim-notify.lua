{
    'rcarriga/nvim-notify',
    opts = {
      -- Default timeout for notifications
      timeout = 1500,
      -- Animation style
      stages = "fade_in_slide_out",
      background_colour = "#2E3440",
    }
}

vim.notify = require("notify")
