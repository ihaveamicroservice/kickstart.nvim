return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
  end,
  keys = {
    {
      '<leader>hq',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Harpoon: Quick menu',
    },
    {
      '<leader>ha',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon: Add file',
    },
    {
      '<leader>hx',
      function()
        require('harpoon'):list():remove()
      end,
      desc = 'Harpoon: Remove file',
    },
    {
      '<leader>hh',
      function()
        require('telescope').extensions.harpoon.marks()
      end,
      desc = 'Harpoon: Telescope UI',
    },
  },
}
