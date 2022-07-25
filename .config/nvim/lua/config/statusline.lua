local M = {}

function M.setup()
  require('lualine').setup {
    options = {
      theme = 'onedark',
      globalstatus = true,
    },
  }
end

return M
