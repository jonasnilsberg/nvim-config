-- Highlights
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='gray' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='gray' })

vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg ='#3B3F52' })
vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg ='#3B3F52' })
vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg ='#3B3F52' })

-- Flash
vim.api.nvim_set_hl(0, 'FlashLabel', { fg = 'yellow' })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
  end,
})

-- Telescope
-- vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#89dceb', fg = '#1e1e2e' })
