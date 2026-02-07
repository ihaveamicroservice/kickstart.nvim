return {
  'tpope/vim-fugitive',
  lazy = false,
  keys = {
    { '<leader>gs', '<cmd>G<CR>', desc = 'Git status' },
    { '<leader>ga', '<cmd>G add .<CR>', desc = 'Git add all' },
    { '<leader>gb', '<cmd>G branch<CR>', desc = 'Git branch' },
    { '<leader>gc', '<cmd>G commit<CR>', desc = 'Git commit' },
    { '<leader>gC', '<cmd>G commit --amend --no-edit<CR>', desc = 'Git amend commit' },
    { '<leader>gp', '<cmd>G pull<CR>', desc = 'Git pull' },
    { '<leader>gP', '<cmd>G push --force-with-lease<CR>', desc = 'Git push' },
    { '<leader>gm', '<cmd>G switch master<CR>', desc = 'Git switch master' },
    { '<leader>g-', '<cmd>G switch -<CR>', desc = 'Git switch -' },
    -- { '<leader>gr', '<cmd>G reset --soft HEAD~1<CR>', desc = 'Git soft reset' },
    -- { '<leader>gR', '<cmd>G reset --hard HEAD~1<CR>', desc = 'Git hard reset' },
  },
}
