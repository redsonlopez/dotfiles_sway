local o = vim.opt
local api  = vim.api

o.relativenumber = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.termguicolors = true
o.cursorline = true

vim.cmd.colorscheme("vim")

-- Clipboard
o.clipboard = { "unnamed", "unnamedplus" }

-- Tabline
o.showtabline = 2
api.nvim_set_hl(0, "TabLineSel", { fg = "#222222", bg = "#222222" })
o.tabline = "%#TabLineSel# "

-- Number + Fold
o.numberwidth = 4
o.foldcolumn = "2"
api.nvim_set_hl(0, "FoldColumn", { bg = "#222222" })
api.nvim_set_hl(0, "CursorLine", { bg = "#2e2e2e" })

api.nvim_set_hl(0, "LineNr",        { fg = "#545454" })
api.nvim_set_hl(0, "CursorLineNr", { fg = "#888888", bold = true })

-- Remover tildes do final do arquivo
o.fillchars = { fold = " ", eob = " " }

-- Statusline
o.laststatus = 2
api.nvim_set_hl(0, "StatusLine", {
  bg = "#222222",
  fg = "#888888",
  bold = true,
  italic = true,
})
o.statusline =
  "%#StatusLine# %m%r%h%w %=%Y - %p%% of the file - line %l,%v of %L "

-- Cor de fundo geral
api.nvim_set_hl(0, "Normal",      { bg = "#222222" })
api.nvim_set_hl(0, "NormalFloat", { bg = "#222222" })

