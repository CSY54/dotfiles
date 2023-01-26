local M = {}

function M.setup()
  require('bufferline').setup {
    options = {
      numbers = 'ordinal',
      diagnostics = 'coc',
      indicator = {
        style = 'underline',
      },
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center',
        },
      },
      show_tab_indicators = true,
    },
  }
end

return M
