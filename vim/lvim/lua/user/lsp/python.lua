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
end

return M
