-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Map save
-- map({ "n", "x" }, "<leader>w", "<cmd>w<cr>", { expr = true, silent = true })

-- Map escape
map("i", "jj", "<esc>", { desc = "Escape" })
