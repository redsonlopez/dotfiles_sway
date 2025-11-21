local o = vim.opt

o.relativenumber = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.termguicolors = true
o.cursorline = true

-- Clipboard
o.clipboard = { "unnamed", "unnamedplus" }

-- Tabline
o.showtabline = 2
o.tabline = "%#TabLineSel# "

-- Number + Fold
o.numberwidth = 4
o.foldcolumn = "2"

-- Remover tildes do final do arquivo
o.fillchars = { fold = " ", eob = " " }

-- Statusline
o.laststatus = 2
o.statusline =
  "%#StatusLine# %m%r%h%w %=%Y - %p%% of the file - line %l,%v of %L "

