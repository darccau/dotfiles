local cmd = vim.cmd
local g = vim.g

g.mapleader = " "
g.auto_save = 0

-- Load plugins
require "plugins"

-- Lsp stuff
require "lsp"
require "saga"

-- Hightlight
require "highlight"

-- Miscelanious
require "misc"

-- Mappings
require "mappings"

-- Autopair
require("nvim-autopairs").setup()

-- Scroll
require("neoscroll").setup() 

-- Comments
require('nvim_comment').setup()

-- File fuzzing
require "file-fuzzing"

-- File tree
require "file-tree"

-- Git 
require('git')


-- Set Gruvbox
cmd "syntax on"
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

