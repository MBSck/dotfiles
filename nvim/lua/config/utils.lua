local M = {}

M.functions = {}

function M.functions.bind(op, outer_opts)
	outer_opts = outer_opts or {noremap = true}
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

function M.functions.map(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
end

function M.functions.combineLists(colorscheme, defaults)
    local combinedList = {}
    for key, value in pairs(colorscheme) do
        if value ~= "" or value ~= nil then
            combinedList[key] = value
        else
            combinedList[key] = defaults[key]
        end
    end
    return combinedList
end


M.keymaps = {
    map = M.functions.map,
    nmap = M.functions.bind("n", {noremap = false}),
    vmap = M.functions.bind("v", {noremap = false}),
    xmap = M.functions.bind("x", {noremap = false}),
    imap = M.functions.bind("i", {noremap = false}),
    tmap = M.functions.bind("t", {noremap = false}),
    smap = M.functions.bind("s", {noremap = false}),
    nnoremap = M.functions.bind("n"),
    vnoremap = M.functions.bind("v"),
    xnoremap = M.functions.bind("x"),
    inoremap = M.functions.bind("i"),
    tnoremap = M.functions.bind("t"),
    snoremap = M.functions.bind("s"),
}

return M
