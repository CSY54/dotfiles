local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup({function(use)
  use { 'wbthomason/packer.nvim' }

  -- tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = [[require('config.treesitter').setup()]],
  }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'nvim-treesitter/playground' }


  -- colorscheme
  use {
    'navarasu/onedark.nvim',
    config = [[require('config.onedark').setup()]],
  }

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.nvimtree').setup()]],
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'onedark.nvim',
    config = [[require('config.statusline').setup()]],
  }

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.bufferline').setup()]],
  }

  -- coc
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = [[require('config.coc').setup()]],
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = [[require('config.telescope').setup()]],
  }

  -- utils
  use { 'jiangmiao/auto-pairs' }
  use { 'numToStr/Comment.nvim', config = [[require('config.comment').setup()]] }
  use { 'nathom/filetype.nvim', config = [[require('config.filetype').setup()]] }
  use { 'Yggdroot/indentLine', config = [[require('config.indentline').setup()]] }
  use { 'sQVe/sort.nvim', config = [[require('config.sort').setup()]] }
  use { 'gpanders/editorconfig.nvim' }
  use { 'f-person/git-blame.nvim', config = [[require('config.git-blame').setup()]] }

  -- waka waka, eh eh
  use { 'wakatime/vim-wakatime' }

  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  git = {
    clone_timeout = 600,
  },
  display = {
    open_fn = require('packer.util').float,
  },
},
})
