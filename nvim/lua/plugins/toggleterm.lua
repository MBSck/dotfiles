local nnoremap = require("remaps.keymap").nnoremap

{
    "akinsho/toggleterm.nvim"
    opts = {
        start_in_insert = true,
        insert_mappings = true,
        direction = 'horizontal',
        persist_size = true,
        close_on_exit = false,
        auto_scroll = true,
        shade_terminals = true,
    }
}

-- Local variables
local python_package_cmd = "python3 -m "..vim.fn.fnamemodify(vim.fn.fnamemodify(vim.fn.getcwd(), ":h"), ":t").."."..vim.fn.fnamemodify(vim.fn.getcwd(), ":t").."."..vim.fn.expand("%:t:r")

-- Terminal variables
local Terminal = require("toggleterm.terminal").Terminal
local terminal_only = Terminal:new()
local python = Terminal:new({ cmd = "python3 "..vim.fn.expand("%, t") })
local python_package = Terminal:new({ cmd = python_package_cmd })
local rust_cargo_run = Terminal:new({ cmd = "cargo run"})
local pytest = Terminal:new({ cmd = "pytest "..vim.fn.expand("%, t") })
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = { border = "double", },
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("Closing terminal")
	end,
})

-- Create a function to open a neovim terminal in a small split window and run python
function _python_toggle()
	python:toggle()
end

-- Create a function to open a neovim terminal in a small split window and run a python module in a package
function _python_package_toggle()
	python_package:toggle()
end

-- Create a function to open a neovim terminal in a small split window and run pytest
function _pytest_toggle()
	pytest:toggle()
end

-- Create a function to open a neovim terminal in a small split window and run pytest
function _rust_cargo_run_toggle()
	rust_cargo_run:toggle()
end

-- Simply opens a toggle Terminal
function _lazygit_toggle()
	lazygit:toggle()
end

-- Simply opens a toggle Terminal
function _terminal_toggle()
	terminal_only:toggle()
end

nnoremap("<f4>", ":w<CR><cmd>lua _pytest_toggle()<CR>", { silent = true })
nnoremap("<f5>", ":w <CR><cmd>lua _python_toggle()<CR>", { silent = true })
nnoremap("<leader><f5>", ":w <CR><cmd>lua _python_package_toggle()<CR>", { silent = true })
nnoremap("<f6>", ":w <CR><cmd>lua  _rust_cargo_run_toggle()<CR>", { silent = true })
nnoremap("<f8>", "<cmd>lua _lazygit_toggle()<CR>", { silent = true })
nnoremap("<f9>", "<cmd>lua _terminal_toggle()<CR>", { silent = true })
