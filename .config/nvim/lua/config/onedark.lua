local M = {}

function M.setup()
  require('onedark').setup {
    style = 'deep',
    ending_tildes = true,
    highlights = {
      rainbowcol1 = { fg = '$yellow' },
      rainbowcol2 = { fg = '$cyan' },
      rainbowcol3 = { fg = '$green' },
      rainbowcol4 = { fg = '$blue' },
      rainbowcol5 = { fg = '$purple' },
      rainbowcol6 = { fg = '$red' },
      rainbowcol7 = { fg = '$orange' },
    },
    code_style = {
      comments = 'italic,bold',
    },
  }

  require('onedark').load()
end

return M
