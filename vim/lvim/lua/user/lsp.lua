local M = {}

M.config = function()
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

  -- Some settings can only passed as commandline flags, see `clangd --help`
  local clangd_flags = {
    "--background-index",
    "--fallback-style=Google",
    "--all-scopes-completion",
    "--clang-tidy",
    "--log=error",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--pch-storage=memory", -- could also be disk
    "--folding-ranges",
    "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
    "--offset-encoding=utf-16", --temporary fix for null-ls
    -- "--limit-references=1000",
    -- "--limit-resutls=1000",
    -- "--malloc-trim",
    -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
    -- "--header-insertion=never",
    -- "--query-driver=<list-of-white-listed-complers>"
  }
end

return M
