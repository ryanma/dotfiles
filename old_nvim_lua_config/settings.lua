local arrows = require("mini.icons").arrows

-- leader keys
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- indentation of four spaces
vim.o.sw = 4
vim.o.ts = 4
vim.o.et = true

-- Show whitespace.
vim.opt.list = true
vim.opt.listchars = { space = '⋅', trail = '⋅', tab = '  ↦' }

-- Show line numbers.
vim.wo.number = true
vim.wo.relativenumber = true
