return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_execute_on_save = 0

    -- Indent in drawer
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dbui',
      callback = function()
        vim.opt_local.shiftwidth = 2
      end,
    })

    -- Size of output panel
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dbout',
      callback = function()
        vim.cmd 'resize 35'
      end,
    })

    -- DB connections
    vim.g.dbs = {}
  end,
  keys = {
    -- Added by default:
    -- <Leader>W - Permanently save query for later use (<Plug>(DBUI_SaveQuery))
    -- <Leader>E - Edit bind parameters (<Plug>(DBUI_EditBindParameters))
    { '<leader>db', '<cmd>tabnew | DBUI<CR>', desc = 'DB UI' },
  },
}
