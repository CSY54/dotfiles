-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  { import = "astrocommunity.ai.copilotchat-nvim" },

  { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.editing-support.nvim-treesitter-context" },

  { import = "astrocommunity.git.git-blame-nvim" },

  { import = "astrocommunity.indent.indent-blankline-nvim" },

  { import = "astrocommunity.lsp.ts-error-translator-nvim" },

  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },

  {
    import = "astrocommunity.media.vim-wakatime",
    cond = function() return vim.fn.filereadable ".nvim-disable-wakatime" == 0 end,
  },

  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },

  { import = "astrocommunity.pack.ansible" },
  -- { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.biome" },
  -- { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.elixir-phoenix" },
  -- { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.just" },
  -- { import = "astrocommunity.pack.laravel" },
  { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.oxlint" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.prettier" },
  -- { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.sql" },
  -- { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
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
