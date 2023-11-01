local M = {}

M.setup = function()
  lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
  lvim.builtin.lualine.extensions = { "neo-tree" }

  lvim.plugins = {
    {
      "p00f/clangd_extensions.nvim", -- Clangd for c++
    },
    {
      "rcarriga/nvim-notify",
    },
    {
      "mfussenegger/nvim-dap-python", -- DAP for python
    },
    {
      "stevearc/dressing.nvim",
    },
    {
      "nvim-neotest/neotest", -- Testing framework
    },
    {
      "nvim-neotest/neotest-python" -- Testing framework for python
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("spectre").setup()
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("neo-tree").setup({
          close_if_last_window = true,
          window = {
            width = 30,
          },
          buffers = {
            follow_current_file = true,
          },
          filesystem = {
            follow_current_file = true,
            filtered_items = {
              hide_dotfiles = true,
              hide_gitignored = true,
              hijack_netrw_behavior = "open_current",
              hide_by_name = {
                "node_modules"
              },
              use_libuv_file_watcher = true,
              never_show = {
                ".DS_Store",
                "thumbs.db"
              },
            },
            event_handlers = {
              {
                event = "neo_tree_buffer_enter",
                handler = function(_) vim.opt_local.signcolumn = "auto" end,
              },
            },
            commands = {
              system_open = function(state)
                vim.ui.open(state.tree:get_node():get_id())
              end,
              parent_or_close = function(state)
                local node = state.tree:get_node()
                if (node.type == "directory" or node:has_children()) and node:is_expanded() then
                  state.commands.toggle_node(state)
                else
                  require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
                end
              end,
              child_or_open = function(state)
                local node = state.tree:get_node()
                if node.type == "directory" or node:has_children() then
                  if not node:is_expanded() then -- if unexpanded, expand
                    state.commands.toggle_node(state)
                  else -- if expanded and has children, seleect the next child
require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                  end
              else -- if not a directory just open it
state.commands.open(state)
end
end,
copy_selector = function(state)
  local node = state.tree:get_node()
local filepath = node:get_id()
local filename = node.name
local modify = vim.fn.fnamemodify

local vals = {
  ["BASENAME"] = modify(filename, ":r"),
["EXTENSION"] = modify(filename, ":e"),
["FILENAME"] = filename,
  ["PATH (CWD)"] = modify(filepath, ":."),
  ["PATH (HOME)"] = modify(filepath, ":~"),
                  ["PATH"] = filepath,
                  ["URI"] = vim.uri_from_fname(filepath),
                }

                local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
                if vim.tbl_isempty(options) then
                  vim.notify("No values to copy", vim.log.levels.WARN)
                  return
                end
                table.sort(options)
                vim.ui.select(options, {
                  prompt = "Choose to copy to clipboard:",
                  format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
                }, function(choice)
  local result = vals[choice]
if result then
                      vim.notify(("Copied: `%s`"):format(result))
                      vim.fn.setreg("+", result)
                    end
                  end)
              end,
              find_in_dir = function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
require("telescope.builtin").find_files {
  cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
}
end,
}, },
mappings = {
            O = "system_open",
            Y = "copy_selector",
            h = "parent_or_close",
            l = "child_or_open",
            o = "open",
          },
        })
      end
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function() require"lsp_signature".on_attach() end,
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" },
        }
      end,
    },
    {
      'Exafunction/codeium.vim',
      config = function()
        -- Change '<C-g>' here to any keycode you like.
        vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
        vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
        vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      end
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup()
      end,
    },
  }
end

return M
