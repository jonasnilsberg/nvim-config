vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "AutoFormat",
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    vim.api.nvim_command("Prettier")
  end,
})

