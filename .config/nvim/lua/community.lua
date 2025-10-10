-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },

  { import = "astrocommunity.git.git-blame-nvim" },

  { import = "astrocommunity.indent.indent-blankline-nvim" },

  { import = "astrocommunity.media.vim-wakatime" },

  { import = "astrocommunity.motion.flash-nvim" },

  -- { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.elixir-phoenix" },
  -- { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  -- { import = "astrocommunity.pack.laravel" },
  { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.php" },
  -- { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.sql" },
  -- { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  -- { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },
  -- { import = "astrocommunity.pack.zig" },

  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },

  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },

  { import = "astrocommunity.utility.noice-nvim" },
}
