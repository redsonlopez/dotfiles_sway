local o = vim.opt

-- Clipboard
o.clipboard = { "unnamed", "unnamedplus" }

-- Cores bem aceitas independente do terminal
o.termguicolors = true

-- Tabline (Tittle)
o.showtabline = 2
--o.tabline = "%#TabLineSel# "

-- Identação e tabulações
o.autoindent = true
o.smartindent = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

-- Exibir caracteres de tabulação e espaços em branco
--o.list = true
--o.listchars = "tab:»·,trail:·"

-- Number + Fold
o.relativenumber = true
o.cursorline = true
o.numberwidth = 4
o.foldcolumn = "2"

-- Definir largura máxima da linha
--o.textwidth = 79
--o.formatoptions = o.formatoptions + "t"

-- Remover tildes do final do arquivo
o.fillchars = { fold = " ", eob = " " }

-- Statusline
o.laststatus = 3
o.statusline =
  "%#StatusLine# %m%r%h%w %=%Y - %p%% of the file - line %l,%v of %L "

