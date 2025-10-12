-- common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.keymap.set("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope fd<CR>", opts)

-- Split vertically/horizontally
vim.keymap.set("n", "<leader>wr", "<cmd>vsplit<CR>", opts)
vim.keymap.set("n", "<leader>wd", "<cmd>split<CR>", opts)

-- Move focus around windows with Shift + arrow keys
vim.keymap.set("n", "<S-left>", "<cmd>wincmd h<CR>", opts)
vim.keymap.set("n", "<S-right>", "<cmd>wincmd l<CR>", opts)
vim.keymap.set("n", "<S-down>", "<cmd>wincmd j<CR>", opts)
vim.keymap.set("n", "<S-up>", "<cmd>wincmd k<CR>", opts)

