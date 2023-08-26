-- set leaders to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs etc
vim.opt.tabstop = 2 -- Seems to be default for most lsp's now
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- line numbers are handy
vim.opt.number = true

-- Use LSP to format bufer automatically just before write
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]