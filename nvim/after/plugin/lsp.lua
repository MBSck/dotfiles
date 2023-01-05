local lsp = require("lsp-zero")
local nnoremap = require("remaps.keymap").nnoremap
local inoremap = require("remaps.keymap").inoremap

lsp.preset("recommended")

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  nnoremap("<leader>gd", function() vim.lsp.buf.definition() end, opts)
  nnoremap("K", function() vim.lsp.buf.hover() end, opts)
  nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  nnoremap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
  nnoremap("<leader>gn", function() vim.diagnostic.goto_next() end, opts)
  nnoremap("<leader>gp", function() vim.diagnostic.goto_prev() end, opts)
  nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  nnoremap("<leader>rf", function() vim.lsp.buf.references() end, opts)
  nnoremap("<leader>rn", function() vim.lsp.buf.rename() end, opts)
  inoremap("<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.nvim_workspace()

lsp.setup()
