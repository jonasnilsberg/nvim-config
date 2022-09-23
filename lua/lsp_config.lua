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

-- TODO: Add check if lsp server is attatched 
vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
vim.api.nvim_create_autocmd("CursorHold", {
    callback = vim.lsp.buf.document_highlight,
    buffer = bufnr,
    group = "lsp_document_highlight",
    desc = "Document Highlight",
})
vim.api.nvim_create_autocmd("CursorMoved", {
    callback = vim.lsp.buf.clear_references,
    buffer = bufnr,
    group = "lsp_document_highlight",
    desc = "Clear All the References",
})
require('lspconfig').tsserver.setup{}
require('lspconfig').pyright.setup{}
require('lspconfig').yamlls.setup{}
require('lspconfig').tailwindcss.setup{}
require('lspconfig').html.setup{}
