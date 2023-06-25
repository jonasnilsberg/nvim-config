require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "yamlls", "tsserver", "tailwindcss", "html",  }
})


-- Keymaps
vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>a', ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gf', ':Trouble lsp_references<CR>')
vim.keymap.set('n', 'rn', ':lua vim.lsp.buf.rename()<CR>')

-- LSP setups
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('typescript').setup({})

require('lspconfig').tailwindcss.setup{
  capabilities = capabilities
}

require('lspconfig').html.setup{
  capabilities = capabilities
}

require('lspconfig').yamlls.setup{
  capabilities = capabilities
}

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
