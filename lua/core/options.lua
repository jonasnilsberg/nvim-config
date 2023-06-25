vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.relativenumber = true
vim.wo.wrap = false

vim.o.scrolloff = 8

local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.clipboard = 'unnamedplus'
set.mouse = 'a'
set.updatetime = 200
set.signcolumn = 'yes'
set.nu = true
set.hlsearch = false
set.smartindent = true
set.expandtab = true


-- Highlights
vim.api.nvim_set_hl(0, "CursorLineNr", { fg='white' })
