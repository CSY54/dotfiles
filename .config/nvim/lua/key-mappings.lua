local utils = require('utils')

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.confirm_selection()
  return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#confirm']() or t'<C-g>u<cr>'
end

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.smart_tab(reverse)
  reverse = reverse or false
  if (vim.fn['coc#pum#visible']() == 1) then
    return reverse and vim.fn['coc#pum#prev'](1) or vim.fn['coc#pum#next'](1)
  elseif (_G.check_back_space()) then
    return reverse and t'<S-tab>' or t'<tab>'
  else
    return vim.fn['coc#refresh']()
  end
end

function _G.show_docs()
  local filetype = vim.bo.filetype
  if (filetype == 'vim' or filetype == 'help') then
    return vim.api.nvim_command('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn.CocAction('hasProvider', 'hover') then
    return vim.fn.CocActionAsync('doHover')
  else
    return vim.api.nvim_feedkeys('K', 'in', false)
  end
end


function _G.scroll_float(forward, fallback)
  if (vim.fn['coc#float#has_scroll']()) then
    return vim.fn['coc#float#scroll'](forward)
  else
    return t(fallback)
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
  { 'i', '<cr>', 'v:lua.confirm_selection()', { silent = true, noremap = true, expr = true } },
  { 'i', '<tab>', 'v:lua.smart_tab()', { silent = true, noremap = true, expr = true } },
  { 'i', '<S-tab>', 'v:lua.smart_tab(1)', { silent = true, noremap = true, expr = true } },
  { 'n', 'K', 'v:lua.show_docs()', { silent = true, expr = true } },
  { 'n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true } },
  { 'n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true } },
  { 'n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true, nowait = true } },
  { 'n', 'gd', '<Plug>(coc-definition)', { silent = true } },
  { 'n', 'gy', '<Plug>(coc-type-definition)', { silent = true } },
  { 'n', '<leader>rn', '<Plug>(coc-rename)', { silent = true } },
  { 'n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true, nowait = true} },
  { 'n', '<leader>a', ':<C-u>CocList diagnostics<cr>', { silent = true, nowait = true } },

  { 'n', '<C-j>', 'v:lua.scroll_float(1, "<C-j>")', { silent = true, nowait = true, expr = true } },
  { 'n', '<C-k>', 'v:lua.scroll_float(0, "<C-k>")', { silent = true, nowait = true, expr = true } },
  { 'i', '<C-j>', 'v:lua.scroll_float(1, "<Right>")', { silent = true, nowait = true, expr = true } },
  { 'i', '<C-k>', 'v:lua.scroll_float(0, "<Left>")', { silent = true, nowait = true, expr = true } },
  { 'v', '<C-j>', 'v:lua.scroll_float(1, "<C-j>")', { silent = true, nowait = true, expr = true } },
  { 'v', '<C-k>', 'v:lua.scroll_float(0, "<C-k>")', { silent = true, nowait = true, expr = true } },

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
