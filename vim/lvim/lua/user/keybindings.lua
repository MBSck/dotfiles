local M = {}

M.setup = function()
  lvim.keys.normal_mode["o"] = "o<ESC>"
  lvim.keys.normal_mode["O"] = "O<ESC>"
  lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
  lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
  lvim.keys.insert_mode["jj"] = "<ESC>"

end

return M
