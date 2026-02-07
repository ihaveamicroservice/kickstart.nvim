return {
  'sindrets/diffview.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false,
  keys = {
    { '<leader>dd', '<cmd>DiffviewOpen<CR>', desc = 'Open Diffview' },
    { '<leader>dx', '<cmd>DiffviewClose<CR>', desc = 'Close Diffview' },
    { '<leader>dh', '<cmd>DiffviewFileHistory<CR>', desc = 'Show File History (all)' },
    { '<leader>df', '<cmd>DiffviewFileHistory %<CR>', desc = 'Show File History (current file)' },
  },
}
