require('nvim-window').setup({
  normal_hl = 'BlackOnLightYellow',
  hint_hl = 'Bold',
  border = 'none'
})

-- Move to window, or swap by using shift + letter
vim.keymap.set('n', '<leader>ll', ":WindowPick<CR>")
vim.keymap.set('n', '<leader>lL', ":lua require('nvim-window').pick()<CR>")
-- Swap with any window
vim.keymap.set('n', '<leader>ls', ":WindowSwap<CR>")
vim.keymap.set('n', '<leader>lq', ":WindowZap<CR>")
