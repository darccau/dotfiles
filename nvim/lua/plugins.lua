local packer = require("packer")

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("wakatime/vim-wakatime")

  use("hoob3rt/lualine.nvim")

  use("folke/tokyonight.nvim")

  use("jose-elias-alvarez/null-ls.nvim")

  use("nvim-lua/plenary.nvim")

  use("neovim/nvim-lspconfig")

  use("nvim-telescope/telescope.nvim")

  use("nvim-telescope/telescope-file-browser.nvim")

  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  use("lewis6991/gitsigns.nvim")

  use("kyazdani42/nvim-web-devicons")

  use("alvan/vim-closetag")

  use("numToStr/Comment.nvim")
end)
