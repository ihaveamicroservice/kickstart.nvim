return {
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>S',
        function()
          require('spectre').toggle()
        end,
        desc = 'Toggle spectre',
      },
      {
        '<leader>sw',
        function()
          require('spectre').open_visual { select_word = true }
        end,
        mode = 'n',
        desc = 'Search word',
      },
      { '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', mode = 'v', desc = 'Search visual' },
      {
        '<leader>sp',
        function()
          require('spectre').open_file_search()
        end,
        desc = 'Search in file',
      },
    },
  },
}
