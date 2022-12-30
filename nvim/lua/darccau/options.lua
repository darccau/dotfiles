-- editor options
local options = {
  mouse = "a",
  number = true,
  hidden = true,
  ignorecase = true,
  smartcase = true,
  splitbelow = true,
  wrap = false,
  splitright = true,
  wildmode = "list:longest",
  virtualedit = "all",
  cursorline = true,
  wildmenu = true,
  smartindent = true,
  shortmess = vim.o.shortmess .. "c",
  scrolloff = 777,
  completeopt = "menuone,noselect",
  clipboard = "unnamedplus",
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  history = 100,
  swapfile = false,
  lazyredraw = true,
  termguicolors = true,
  expandtab = true,
  foldmethod = "marker",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
