require("nvim-tree").setup({
  git = {
    enable = true,
  },
  renderer = {
    icons = {
      webdev_colors = true,
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
})

local devicons = require("nvim-web-devicons")

function _G.my_tabline()
  local s = ""

  for i = 1, vim.fn.tabpagenr("$") do
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]

    local filename = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ":t")
    if filename == "" then
      filename = "[No Name]"
    end

    -- Corrigido: pega extensão sem ponto
    local ext = filename:match("%.([^.]+)$") or ""

    -- Ícone correto por arquivo
    local icon, icon_hl = devicons.get_icon(filename, ext, { default = true })

    -- Se falhar, usa fallback
    if not icon then
      icon = ""
    end

    -- Tab selecionada ou não
    local hl = i == vim.fn.tabpagenr()
      and "%#TabLineSel#"
      or "%#TabLine#"

    s = s .. hl .. " " .. icon .. " " .. filename .. " "
  end

  return s .. "%#TabLineFill#"
end

vim.o.tabline = "%!v:lua.my_tabline()"

