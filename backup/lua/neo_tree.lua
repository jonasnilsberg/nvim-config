require 'window-picker'.setup({})
require("neo-tree").setup({
  enable_diagnostics = false,
  event_handlers = {
    {
      event = "file_opened",
      handler = function(file_path)
        --auto close_all
        require("neo-tree").close_all()
      end
      },
  }
})
