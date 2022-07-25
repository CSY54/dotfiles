local utils = require('utils')

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.confirm_selection()
  return vim.fn.pumvisible() == 1 and vim.fn['coc#_select_confirm']() or t'<C-g>u<cr>'
end

function _G.check_back_space()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

function _G.smart_tab(reverse)
  reverse = reverse or false
  if (vim.fn.pumvisible() == 1) then
    return reverse and t'<C-p>' or t'<C-n>'
  elseif (_G.check_back_space()) then
    return reverse and t'<S-TAB>' or t'<TAB>'
  else
    return vim.fn['coc#refresh']()
  end
end

local key_mappings = {
  -- no arrow keys
  { 'n', '<up>', '<nop>' },
  { 'n', '<down>', '<nop>' },
  { 'n', '<left>', '<nop>' },
  { 'n', '<right>', '<nop>' },

  -- no shift needed
  { 'n', ';', ':' },

  -- pane navigation
  { 'n', '<C-h>', '<C-w><C-h>' },
  { 'n', '<C-j>', '<C-w><C-j>' },
  { 'n', '<C-k>', '<C-w><C-k>' },
  { 'n', '<C-l>', '<C-w><C-l>' },

  -- buffer navigation
  { 'n', '[b', ':BufferLineCyclePrev<cr>', { silent = true } },
  { 'n', ']b', ':BufferLineCycleNext<cr>', { silent = true } },

  -- file tree
  { 'n', '<C-n>', ':NvimTreeToggle<cr>', { silent = true } },

  -- coc
  { 'i', '<cr>', 'v:lua.confirm_selection()', { silent = true, expr = true } },
  { 'i', '<tab>', 'v:lua.smart_tab()', { silent = true, expr = true } },
  { 'i', '<S-tab>', 'v:lua.smart_tab(1)', { silent = true, expr = true } },

  -- telescope
  { 'n', '<leader>ff', ':Telescope find_files<cr>' },
  { 'n', '<leader>fg', ':Telescope live_grep<cr>' },
  { 'n', '<leader>fb', ':Telescope buffers<cr>' },
  { 'n', '<leader>fh', ':Telescope help_tags<cr>' },
}

utils.for_each(
  key_mappings,
  function(v)
    utils.set_key_map(v[1], v[2], v[3], v[4])
  end
)
