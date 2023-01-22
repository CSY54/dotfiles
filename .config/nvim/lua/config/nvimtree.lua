local M = {}

function M.setup()
  require('nvim-tree').setup {
    open_on_setup = true,
    open_on_setup_file = true,
    view = {
      mappings = {
        list = {
          { key = 's', action = 'vsplit' },
          { key = 'i', action = 'split' },
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
    git = {
      ignore = false,
    },
    actions = {
      open_file = {
        window_picker = {
          chars = '1234567890',
        },
      },
    },
  }
end

return M
