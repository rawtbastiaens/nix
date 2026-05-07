return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'sindrets/diffview.nvim', -- optional
    --"esmuellert/codediff.nvim",      -- optional
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
  },
}
