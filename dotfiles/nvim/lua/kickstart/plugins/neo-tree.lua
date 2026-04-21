-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      -- Event handler to move to buffer left when opening with nvim . 
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd("wincmd l")
          end,
        },
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ["l"] = "open",
          ["h"] = "close_node",
        },
        position = "left",
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
      hijack_netrw_behavior = "open_current",
      },
    },
}
