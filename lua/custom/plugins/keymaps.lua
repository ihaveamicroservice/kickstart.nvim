vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Exit insert mode with jj' })
vim.keymap.set('n', '<leader>H', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = '[H]over' })

-- Smart gx: Open URLs in browser, files in Neovim
vim.keymap.set('n', 'gx', function()
  local file = vim.fn.expand '<cfile>'
  if file:match 'https?://' then
    -- It's a URL, open in browser
    vim.fn.jobstart({ 'open', file }, { detach = true })
  else
    -- It's a file path, open in Neovim
    vim.cmd('edit ' .. file)
  end
end, { desc = 'Open URL in browser or file in Neovim' })

vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

vim.keymap.set('n', '<C-Up>', '<cmd>:resize +2<CR>', { desc = 'Taller' })
vim.keymap.set('n', '<C-Down>', '<cmd>:resize -2<CR>', { desc = 'Shorter' })
vim.keymap.set('n', '<C-Left>', '<cmd>:vertical resize +10<CR>', { desc = 'Wider' })
vim.keymap.set('n', '<C-Right>', '<cmd>:vertical resize -10<CR>', { desc = 'Narrower' })

vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

return {}
