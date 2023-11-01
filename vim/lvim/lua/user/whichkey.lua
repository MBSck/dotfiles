local M = {}

M.setup = function()
  -- NeoTree
  lvim.builtin.which_key.mappings["e"]= {"<cmd>NeoTreeFocusToggle<cr>", "Toggle NeoTree"}

  -- Session
  lvim.builtin.which_key.mappings["S"]= {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  }

  -- Terminal
  lvim.builtin.which_key.mappings["t"] = {
    name = "Terminal",
    t = { "<cmd>ToggleTerm direction=float<cr>", "Toggle terminal" },
    h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal terminal" },
    v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical terminal" },
  }
  lvim.builtin.terminal.open_mapping = "<f7>"

  -- Neotest
  lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
    "Test Method" }
  lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
    "Test Method DAP" }
  lvim.builtin.which_key.mappings["df"] = {
    "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
  lvim.builtin.which_key.mappings["dF"] = {
    "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
  lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }
end

return M
