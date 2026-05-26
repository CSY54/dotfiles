-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true, -- enable/disable treesitter based highlighting
      indent = true, -- enable/disable treesitter based indentation
      auto_install = true, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
        -- NOTE: use "all" to install all
        "asm",
        "astro",
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        -- "cuda",
        "diff",
        -- "disassembly",
        "dockerfile",
        -- "elixir",
        -- "go",
        "html",
        "javascript",
        "json",
        "jsonc",
        "just",
        "lua",
        "make",
        "markdown",
        -- "php",
        -- "prisma",
        "python",
        "regex",
        -- "rust",
        "scss",
        -- "solidity",
        -- "sql",
        -- "svelte",
        "toml",
        "typescript",
        "vue",
        -- "zig",
        "zsh",
      },
    },
  },
}
