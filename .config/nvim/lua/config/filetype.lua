local M = {}

function M.setup()
  vim.g.did_load_filetypes = 1

  require('filetype').setup {
    overrides = {
      extensions = {
        sage = 'python',
        ino = 'cpp',
      },
    },
  }
end

return M
