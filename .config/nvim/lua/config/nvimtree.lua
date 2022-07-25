local M = {}

function M.setup()
  require('nvim-tree').setup {
    open_on_setup = true,
    open_on_setup_file = true,
  }
end

return M
