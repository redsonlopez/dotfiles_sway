require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "bash",
    "json",
    "yaml",
    "markdown",
  },
  highlight = {
    enable = true,
  },
})

