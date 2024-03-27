local set = vim.opt
vim.g.mapleader = " "

set.nu = true
set.relativenumber = true
set.exrc = true
set.wrap = false
set.backup = false
set.undofile = true
set.shortmess = "c"
set.hlsearch = false
set.incsearch = true
set.swapfile = false

-- set.clipboard = "unnamedplus"
set.tabstop = 4
set.scrolloff = 8
set.shiftwidth = 4
set.softtabstop = 0
set.expandtab = true
set.updatetime = 50
set.signcolumn = "yes"
set.termguicolors = true
set.cursorline = true
set.undodir = vim.fn.expand("~/.vim/undodir")
