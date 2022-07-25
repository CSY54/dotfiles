local M = {}

function M.set_key_map(mode, keybind, cmd, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, keybind, cmd, options)
end

function M.for_each(table, callback)
  for key, value in pairs(table) do
    callback(value, key)
  end
end

return M
