vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end



-- This also sets up tsserver so no need for require('lspconfig').tsserver.setup{}
require('typescript').setup({})

require('lspconfig').pyright.setup{}
require('lspconfig').yamlls.setup{}
require('lspconfig').tailwindcss.setup{}
require('lspconfig').html.setup{}
require('lspconfig').eslint.setup{}
