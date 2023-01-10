local options = {
  mouse = "a",
  number = true,
  cursorline = true,
  wildmenu = true,
  virtualedit = "all",
  wrap = false,
  ignorecase = true,
  list = true,
  modeline = true,
  shada = { "!", "'500", "<50", "s10", "h" },
  showmode = false,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  textwidth = 120,
  wildignorecase = true,
  wildmode = "list:longest",
  updatetime = 500,
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
vim.g.omni_sql_default_compl_type = "syntax"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

