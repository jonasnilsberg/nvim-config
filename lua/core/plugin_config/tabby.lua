local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}
require('tabby.tabline').set(function(line)
  return {
    {
      -- line.sep('', theme.head, theme.fill),
      -- { 'Tabs', hl = theme.tail },
      line.sep('', theme.head, theme.head),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.head),
        tab.number(),
        tab.name(),
        line.sep('', hl, theme.head),
        hl = hl,
        margin = ' ',
      }
    end),
  }
end)


-- Keymaps
vim.keymap.set('n', 'tc', ':tabnew<CR>')
vim.keymap.set('n', 'tn', ':tabnext<CR>')
vim.keymap.set('n', 'tN', ':tabprevious<CR>')
vim.keymap.set('n', 'tq', ':tabclose<CR>')
