require('plugins')
require('key-mappings')

local o = vim.opt

o.relativenumber = true
o.mouse = 'a'
o.ruler = true
o.wrap = false -- nowrap
o.cursorline = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.laststatus = 3 -- always and ONLY the last window
o.scrolloff = 5
o.clipboard = 'unnamed'
o.fileformat = 'unix'
o.splitbelow = true
o.splitright = true
o.showmode = false
o.title = true
o.showtabline = 2 -- always
o.hidden = true
o.backup = false
o.writebackup = false
o.cmdheight = 1
o.updatetime = 300
o.shortmess = o.shortmess + 'c'
o.signcolumn = 'yes'
o.termguicolors = true
