local cmd = vim.cmd

local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- General
g.mapleader = ' '
opt.mouse = 'a'
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

-- Neovim UI
opt.number = true
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.colorcolumn = '80'
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 999
cmd[[set nowrap]]

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Cursorline
cmd [[
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
]]

-- Memory, CPU
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

-- Colorscheme
opt.termguicolors = true      -- enable 24-bit RGB colors

cmd[[let g:tokyonight_style = "night"]]
cmd [[colorscheme tokyonight]]

-- Tabs, indent
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 2        -- shift 4 spaces when tab
opt.tabstop = 2           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- insert mode completion options
 opt.completeopt = 'menuone,noselect'

 -- disable builtins plugins
 local disabled_built_ins = {
     "netrw",
     "netrwPlugin",
     "netrwSettings",
     "netrwFileHandlers",
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
     "matchit"
 }

 for _, plugin in pairs(disabled_built_ins) do
     g["loaded_" .. plugin] = 1
 end

-- disable nvim intro
 opt.shortmess:append "sI"
