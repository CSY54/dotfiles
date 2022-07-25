local M = {}

function M.setup()
  vim.g.gitblame_ignored_filetypes = {
    'packer',
    'NvimTree',
  }
end

return M
