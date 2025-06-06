local arrows = require("mini.icons").arrows

-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- highlight column at 80 characters -- max line length
vim.o.colorcolumn = "80"

-- indentation of two spaces
vim.o.sw = 2
vim.o.ts = 2
vim.o.et = true

-- Show whitespace.
vim.opt.list = true
vim.opt.clipboard = "unnamedplus"
-- vim.opt.listchars = { space = '⋅', trail = '⋅', tab = '  ↦' }

-- Show line numbers.
vim.wo.number = true
vim.wo.relativenumber = true

-- Show errors and warnings in a floating window
vim.opt.updatetime = 1500
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
    end,
})
