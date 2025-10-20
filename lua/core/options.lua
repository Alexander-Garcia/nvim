local opt = vim.opt
local global = vim.g

-- Per recommendation on nvim-tree
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

-- Spaces
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.numberwidth = 4

-- for detailed spacing
opt.listchars = { lead = "·", trail = "·" }
opt.list = true
-- line numbers
opt.number = true
-- realtive line numbers
vim.wo.relativenumber = true

-- nice
opt.signcolumn = "yes"

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.incsearch = true

-- Colors
opt.termguicolors = true
opt.background = "dark"

-- clipboard
opt.clipboard = "unnamedplus"

-- avante
opt.laststatus = 3
