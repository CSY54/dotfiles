-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    sage = "python",
    ino = "cpp",
  },
}

vim.opt.backup = false
vim.opt.scrolloff = 5
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
