return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require 'nvim-tree'

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup {
      view = {
        relativenumber = true,
        adaptive_size = true,
      },
      -- change folder arrow icons
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
        },
      },
      git = {
        ignore = false,
      },
      update_focused_file = {
        enable = true,
      },
    }

    -- set keymaps
    vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFocus<CR>', { desc = 'Bring focus to the file explorer' })
    vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
    vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })
  end,
}
