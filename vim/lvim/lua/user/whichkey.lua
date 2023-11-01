local M = {}

M.setup = function()
  lvim.builtin.which_key.mappings["e"]= {"<cmd>NeoTreeFocusToggle<cr>", "Toggle NeoTree"}
  lvim.builtin.which_key.mappings["S"]= {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  }
  lvim.builtin.which_key.mappings["t"] = {
    name = "Terminal",
    t = { "<cmd>ToggleTerm direction=float<cr>", "Toggle terminal" },
    h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal terminal" },
    v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical terminal" },
  }
  lvim.builtin.terminal.open_mapping = "<f7>"
end

return M
