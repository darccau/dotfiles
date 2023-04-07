-- editor options
local options = {
  mouse = "a",
  number = true,
  cursorline = true,
  wildmenu = true,
  virtualedit = "all",
  wrap = false,
  ignorecase = true,
  modeline = true,
  showmode = false,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  textwidth = 120,
  wildignorecase = true,
  smartindent = true,
  shortmess = vim.o.shortmess .. "c",
  scrolloff = 12,
  completeopt = { "menu", "menuone", "noselect" },
  clipboard = "unnamedplus",
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  swapfile = false,
  expandtab = true,
  foldlevel = 99,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.python3_host_prog = "python"
vim.g["test#strategy"] = "neovim"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
