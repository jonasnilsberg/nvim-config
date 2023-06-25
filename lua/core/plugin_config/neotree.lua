require 'window-picker'.setup({})
require("neo-tree").setup({
  enable_diagnostics = false,
  event_handlers = {
    {
      event = "file_opened",
      handler = function(_)
        --auto close_all
        require("neo-tree").close_all()
      end
      },
  }
})

vim.keymap.set('n', '<leader>t', "<cmd>Neotree position=float dir=./ toggle reveal<cr>")
