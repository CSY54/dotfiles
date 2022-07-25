local M = {}

function M.setup()
  require('telescope').setup {
    defaults = {
      file_ignore_patterns = {
        'node_modules',
        'vendor',
      },
    },
  }
end

return M
