local M = {}

M.setup = function()
  -- Visual.
  vim.opt.relativenumber = true -- relative line numbers
  lvim.format_on_save = false
end

return M
