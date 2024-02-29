-- common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.keymap.set("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>ss", "<cmd>Telescope grep_string<CR>", opts)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope fd<CR>", opts)

