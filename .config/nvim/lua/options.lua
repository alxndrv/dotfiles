-- General
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard

-- Remove underscore (_) from the list of WORD characters
vim.cmd(":set iskeyword-=_")

-- Tab stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true 

-- UI config
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
