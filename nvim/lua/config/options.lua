vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"
vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
local opt = vim.opt

-- if not vim.env.SSH_TTY then
--   -- only set clipboard if not in ssh, to make sure the OSC 52
--   -- integration works automatically. Requires Neovim >= 0.10.0
--   opt.clipboard = "unnamedplus" -- Sync with system clipboard
-- end
--
-- if not vim.g.vscode then
--   opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
-- end
--
--
-- if vim.fn.has("nvim-0.10") == 1 then
--   opt.smoothscroll = true
-- end
--
-- -- Folding
-- vim.opt.foldlevel = 99
--
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
--   vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
-- end
--
-- -- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
-- if vim.fn.has("nvim-0.10") == 1 then
--   vim.opt.foldmethod = "expr"
--   vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
--   vim.opt.foldtext = ""
--   vim.opt.fillchars = "fold: "
-- else
--   vim.opt.foldmethod = "indent"
-- end
--
-- vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
--
-- -- Fix markdown indentation settings
-- vim.g.markdown_recommended_style = 0

local options = {
  confirm = false,
  autowrite = true,
  completeopt = "menu,menuone,noselect",
  conceallevel = 2,
  cursorline = true,
  expandtab = true,
  formatoptions = "jcroqlnt",
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  ignorecase = true,
  inccommand = "nosplit",
  laststatus = 3,
  list = true,
  mouse = "a",
  number = true,
  pumblend = 10,
  pumheight = 10,
  relativenumber = true,
  scrolloff = 4,
  -- sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },
  shiftround = true,
  shiftwidth = 2,
  -- shortmess:append({ W = true, I = true, c = true, C = true }),
  showmode = false,
  sidescrolloff = 8,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  spelllang = { "en" },
  splitbelow = true,
  splitkeep = "screen",
  splitright = true,
  tabstop = 2,
  termguicolors = true,
  undofile = true,
  undolevels = 10000,
  updatetime = 200,
  virtualedit = "block",
  wildmode = "longest:full,full",
  winminwidth = 5,
  wrap = false,
  fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
  },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
