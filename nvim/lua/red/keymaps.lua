vim.g.mapleader = " "

local map = vim.keymap.set

-- Abre/fecha NvimTree com Space+e 
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
-- Próximo buffer com Shift+l
map("n", "<S-l>", ":bnext<CR>", { silent = true })
-- Buffer anterior com Shift+h
map("n", "<S-h>", ":bprevious<CR>", { silent = true })

