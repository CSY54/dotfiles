-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
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

-- 1. mise tool-alias set python neovim <version>
-- 2. mise x python@neovim -- pip install pynvim
-- 3. RES=$(mise where python@neovim)
-- 4. fill in "$RES/bin/python" below
vim.g.python3_host_prog = vim.fn.expand "~/.local/share/mise/installs/python/3.14.5/bin/python"

-- 1. mise tool-alias set node neovim <version>
-- 2. mise x node@neovim -- npm i -g neovim
-- 3. RES=$(mise where node@neovim)
-- 4. fill in "$RES/bin/neovim-node-host" below
vim.g.node_host_prog = vim.fn.expand "~/.local/share/mise/installs/node/24.15.0/bin/neovim-node-host"
