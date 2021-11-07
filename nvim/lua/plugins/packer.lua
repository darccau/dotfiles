local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- autopair
  use 'windwp/nvim-autopairs'

  use 'sindrets/diffview.nvim'

  use 'nvim-telescope/telescope.nvim'

  use 'mhartington/formatter.nvim'

  use 'folke/tokyonight.nvim'
  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  use 'terrortylor/nvim-comment'

  require('nvim_comment').setup()

  use { 'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use 'TimUntersberger/neogit'
  use 'nvim-lua/plenary.nvim'
end)

