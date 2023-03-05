-- Vimscript to Lua conversion.
-- "set" keyword equals to "opt"
-- "vim.g" global variable
-- "vim.b" buffer variable
-- "vim.w" window variable
-- "vim.t" tabpage variable
-- "vim.v" predefined vim variable
-- "vim.env" environment variable

-- Leaders
vim.g.mapleader = ","
vim.g.maplocalleader = ";"
vim.g.mapgloballeader = ":"

-- Configuration setting
require("config")

-- General settings
require("general")
