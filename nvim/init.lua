require("red.plugins")
--require("red.lsp")
require("red.treesitter")
require("red.nvim-tree")
require("red.keymaps")
require("red.settings")
require("red.theme")

-- Ativa o tabline
vim.o.showtabline = 2

-- Grupo de highlight (você pode personalizar as cores)
vim.cmd [[
  highlight TabLineSel guifg=#ffffff guibg=#2e2e2e gui=italic
  highlight TabLine guifg=#545454 guibg=#222222 gui=italic
  highlight TabLineFill guibg=#222222
]]


-- Ícones por extensão
local icons = {
  lua = "󰢱",
  py  = "",
  js  = "󰌞",
  ts  = "󰛦",
  html= "󰌝",
  css = "󰌜",
  md  = "󰍔",
  json= "󰘦",
  lock= "󰌾",
  default = "",
}

local function get_icon(filename)
  local ext = filename:match("^.+%.(.+)$")
  return icons[ext] or icons.default
end

-- Função que renderiza o tabline
function _G.my_tabline()
  local s = ""
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
      local icon = get_icon(name)

      -- Escolhe o highlight
      if buf == current then
        s = s .. "%#TabLineSel# " .. icon .. " " .. name .. " %*"
      else
        s = s .. "%#TabLine# " .. icon .. " " .. name .. " %*"
      end
    end
  end

  s = s .. "%#TabLineFill#"
  return s
end

vim.o.tabline = "%!v:lua.my_tabline()"

