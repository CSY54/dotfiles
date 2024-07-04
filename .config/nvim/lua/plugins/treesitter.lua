-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "comment",
      "cpp",
      "css",
      "dockerfile",
      "elixir",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "php",
      "prisma",
      "pug",
      "python",
      "regex",
      "scss",
      "sql",
      "typescript",
      "verilog",
      "vue",
    },
  },
}
