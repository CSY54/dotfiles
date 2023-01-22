local M = {}

function M.setup()
  vim.g.indentLine_char_list = { '|', '¦', '┆', '┊' }
  vim.g.indentLine_fileTypeExclude = {
    'NvimTree',
  }
end

return M
