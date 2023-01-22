local M = {}

function M.setup()
  -- ref: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
  vim.api.nvim_create_autocmd(
    { 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' },
    {
      group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
      callback = function()
        vim.opt.foldlevel = 20
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
      end
    }
  )

  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'c',
      'comment',
      'cpp',
      'css',
      'dockerfile',
      'elixir',
      'go',
      'html',
      'javascript',
      'json',
      'lua',
      'make',
      'markdown',
      'php',
      'prisma',
      'pug',
      'python',
      'regex',
      'scss',
      'sql',
      'typescript',
      'verilog',
      'vue',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 500,
    },
    autotag = {
      enable = true,
    },
    playground = {
      enable = true,
    },
  }
end

return M
