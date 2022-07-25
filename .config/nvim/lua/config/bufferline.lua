local M = {}

function M.setup()
  require('bufferline').setup {
    options = {
      offsets = {
        {
          filetype = 'NvimTree',
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = 'Directory',
          text_align = 'center',
        },
      },
    },
  }
end

return M
