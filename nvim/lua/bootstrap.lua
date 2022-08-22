local packer = require 'packer'

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'wakatime/vim-wakatime'

  use 'hoob3rt/lualine.nvim'

  use 'akinsho/nvim-bufferline.lua'

  use "williamboman/mason.nvim"

  use "williamboman/nvim-lsp-installer"

  use 'jose-elias-alvarez/null-ls.nvim'

  use "nvim-lua/plenary.nvim"

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use 'glepnir/lspsaga.nvim' 
  use 'windwp/nvim-autopairs'

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'L3MON4D3/LuaSnip'
  use {
    'saadparwaiz1/cmp_luasnip',
    requires = {'L3MON4D3/LuaSnip'}
  }

  use {
    'rafamadriz/friendly-snippets',
    requires = {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'}
  }

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use 'lewis6991/gitsigns.nvim'

  use 'folke/tokyonight.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use 'alvan/vim-closetag'

  use "rcarriga/nvim-notify" 

  use("numToStr/Comment.nvim")

  use("sindrets/diffview.nvim")

  use("tpope/vim-fugitive")

end)
