require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "yamlls", "tsserver", "tailwindcss", "html",  }
})


-- Keymaps
vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>E', ':lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>a', ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gf', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'rn', ':lua vim.lsp.buf.rename()<CR>')

-- LSP setups
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('typescript-tools').setup({})

require('lspconfig').tailwindcss.setup{
  capabilities = capabilities,
  update_in_insert = true
}

require('lspconfig').intelephense.setup{
  capabilities = capabilities,
  update_in_insert = true
}

require('lspconfig').html.setup{
  capabilities = capabilities,
  update_in_insert = true
}

require('lspconfig').helm_ls.setup{
  capabilities = capabilities,
  update_in_insert = true,
  filetypes = {"helm"},
  cmd = {"helm_ls", "serve"},
}

require('lspconfig').yamlls.setup{
  capabilities = capabilities,
  update_in_insert = true
}

require('lspconfig').jsonls.setup{
  capabilities = capabilities,
  update_in_insert = true
}

require('lspconfig').gopls.setup{
  capabilities = capabilities,
  update_in_insert = true
}

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  update_in_insert = true,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
