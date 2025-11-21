vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
map("i", "jj", "<Esc>")

