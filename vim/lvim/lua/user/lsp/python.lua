local M = {}

M.setup = function()
  -- Formatter
  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup { { name = "black" }, }

  -- Linter
  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup { { command = "flake8", filetypes = { "python" } } }

  -- Debug Adapter
  lvim.builtin.dap.active = true
  local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
  pcall(function()
    require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
  end)

  -- Testing
  require("neotest").setup({
    adapters = {
      require("neotest-python")({
        -- Extra arguments for nvim-dap configuration
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = {
          justMyCode = false,
          console = "integratedTerminal",
        },
        args = { "--log-level", "DEBUG", "--quiet" },
        runner = "pytest",
      })
    }
  })
end

return M
