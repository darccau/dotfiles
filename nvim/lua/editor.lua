local opt = vim.opt

local function set_globals()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/3.8.2/bin/python")
  vim.g["test#strategy"] = "neovim"
  vim.g.omni_sql_default_compl_type = "syntax"
end

local function set_ui_options()
  opt.termguicolors = true
  opt.mouse = "a"
  opt.title = true
  opt.titlestring = "%{join(split(getcwd(), '/')[-2:], '/')}"
  opt.number = true
  opt.relativenumber = true
  opt.colorcolumn = "120"

  -- colorscheme configs
  vim.g.tokyonight_style = "night"
  vim.cmd("colorscheme tokyonight")
end

local function set_editor_options()
  local options = {
    autoread = true,
    hidden = true,
    ignorecase = true,
    inccommand = "nosplit",
    incsearch = true,
    laststatus = 2,
    list = true,
    listchars = [[eol:↴,tab:>-,trail:~,extends:>,precedes:<]],
    modeline = true,
    shada = [[!,'500,<50,s10,h]],
    showcmd = true,
    showmode = false,
    smartcase = true,
    splitbelow = true,
    splitright = true,
    startofline = false,
    textwidth = 120,
    viminfo = [[!,'300,<50,s10,h]],
    wildignorecase = true,
    wildmenu = true,
    wildmode = "list:longest",
    updatetime = 500,
    autoindent = true,
    smartindent = true,
    shortmess = vim.o.shortmess .. "c",
    scrolloff = 12,
    completeopt = "menu,menuone,noselect",
    clipboard = "unnamedplus",
    shiftwidth = 2,
    softtabstop = 2,
    tabstop = 2,
    swapfile = false,
    expandtab = true,
    foldmethod = "indent",
    foldlevelstart = 99,
  }
  for k, v in pairs(options) do
    opt[k] = v
  end
end

local function set_options()
  set_editor_options()
  set_ui_options()
end

local function set_mappings()
  local opts = { noremap = true, silent = true }
  local mappings = {
    { "n", "<leader>e", [[<Cmd>edit $HOME/.config/nvim/lua/editor.lua<CR>]], opts }, -- quick edit editor.lua file
    { "n", "<leader>b", [[<Cmd>edit $HOME/.config/nvim/lua/bootstrap.lua<CR>]], opts }, -- quick edit plugins.lua file
    { "n", "<leader>U", [[<Cmd>PackerSync<CR>]], opts },
    { "n", "<leader>R", [[<Cmd>lua RR()<CR>]], opts }, 

    {"n", "<leader>a", [[<Cmd>noh<CR>]], opts},
    {"n", "<leader>h", [[<Cmd>bfirst<CR>]], opts},
    {"n", "<leader>l", [[<Cmd>blast<CR>]], opts},
    {"n", "<leader>j", [[<Cmd>bp<CR>]], opts},
    {"n", "<leader>k", [[<Cmd>bn<CR>]], opts},
    {"n", "<leader>d", [[<Cmd>bd<CR>]], opts},
    {"n", "<leader>c", [[<Cmd>cclose<CR>]], opts},
    {"n", "ss", [[<Cmd>split<CR>]], opts},
    {"n", "sv", [[<Cmd>vsplit<CR>]], opts},
    {"v", "<", [[<gv]], opts},
    {"v", ">", [[>gv]], opts},
    {"n", "<leader>w", [[<Cmd>up<CR>]], opts},
    {"n", "<leader>q", [[<Cmd>q<CR>]], opts},
    {"n", ";", ":", opts},
    {"i", "jk", "<esc>", opts},
    {"i", "kj", "<esc>", opts},
    {"n", [[<leader>u]], ":%! sort -uV<cr>", opts},
    {'n', 'Y', 'y$', opts},
    {'n', 'n', 'nzzzv', opts},
    {'n', 'N', 'Nzzzv', opts},
    {'n', 'J', 'mzJ`z', opts},
    {'i', ',', ',<c-g>u', opts},
    {'i', '.', '.<c-g>u', opts},
    {'i', '!', '!<c-g>u', opts},
    {'i', '?', ',<c-g>u', opts},
    {'n', '<leader>i', 'gq<cr>', opts},
    {'n', '<leader>s', '/', opts},
    {'n', 'U', '<C-r>', opts},
    {'n', 'sh', '<C-w>h', opts},
    {'n', 'sj', '<C-w>j', opts},
    {'n', 'sk', '<C-w>k', opts},
    {'n', 'sl', '<C-w>l', opts},
    {'n', 'te', ':tabedit<return>', opts},
  }

  for _, map in pairs(mappings) do
    vim.api.nvim_set_keymap(unpack(map))
  end

  -- remember last cursor position
  vim.cmd([[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]])
end

set_globals()
set_options()
set_mappings()
