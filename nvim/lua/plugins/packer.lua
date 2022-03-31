local packer = require 'packer'

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tamago324/lir.nvim'

  use 'jose-elias-alvarez/null-ls.nvim'

  use 'windwp/nvim-autopairs'

  use 'nvim-telescope/telescope.nvim'

  use 'mhartington/formatter.nvim'

  use 'folke/tokyonight.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use 'nvim-treesitter/nvim-treesitter'

  use 'alvan/vim-closetag'

  use 'TimUntersberger/neogit'

  use 'nvim-lua/plenary.nvim'
end)

