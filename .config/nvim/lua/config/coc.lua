local M = {}

function M.setup()
  vim.g.coc_global_extensions = {
    'coc-clangd',
    'coc-elixir',
    'coc-eslint',
    'coc-go',
    'coc-json',
    'coc-markdownlint',
    'coc-phpls',
    'coc-pyright',
    'coc-tsserver',
    '@yaegassy/coc-volar',
  }
end

return M
