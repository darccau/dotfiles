vim.g.mapleader = ";"

local options = {
  confirm = false,
  laststatus = 0,
  backup = false,
  backupskip = { "/tmp/*", "/private/tmp/*" },
  breakindent = true,
  foldmethod = "expr",
  formatoptions = "jcroqlnt",
  mouse = "",
  relativenumber = false,
  diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
  splitkeep = "cursor",
  textwidth = 120,
  splitbelow = true,
  splitright = true,
  virtualedit = "all",
  spelllang = "en",
  wrap = false,
}

for option, parameter in pairs(options) do
  vim.opt[option] = parameter
end
