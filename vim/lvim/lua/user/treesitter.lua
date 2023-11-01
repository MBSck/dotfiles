local M = {}

M.setup = function()
  lvim.builtin.treesitter.highlight.enable = true
  lvim.builtin.treesitter.ensure_installed = { "python", "cpp", "c" }
end

return M
