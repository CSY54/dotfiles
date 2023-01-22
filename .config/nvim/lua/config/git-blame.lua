local M = {}

function M.setup()
  vim.g.gitblame_ignored_filetypes = {
    'NvimTree',
    'packer',
  }
end

return M
