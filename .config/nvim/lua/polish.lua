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

-- disable lsp for `.env` files
local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env*",
  group = group,
  callback = function(args)
    vim.diagnostic.enable(false, {
      bufnr = args.buf,
    })
  end,
})

vim.opt.backup = false
vim.opt.scrolloff = 5
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
