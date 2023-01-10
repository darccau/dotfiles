local disable_built_ins = {
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in pairs(disable_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "wbthomason/packer.nvim",
  "wakatime/vim-wakatime",
  "hoob3rt/lualine.nvim",
  "folke/tokyonight.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "lewis6991/gitsigns.nvim",
  "kyazdani42/nvim-web-devicons",
  "alvan/vim-closetag",
  "numToStr/Comment.nvim",
}

require("lazy").setup(plugins, disable_built_ins)
