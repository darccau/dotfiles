require('bootstrap')

local cmd = vim.cmd

cmd [[set nowrap]]
cmd [[au VimEnter * hi CursorLine ctermfg=white guibg=#173c79 cterm=bold]]
cmd [[au VimEnter * hi CursorLineNr ctermfg=white guibg=#173c79 guifg=white]]
cmd [[au VimEnter * hi LineNr ctermfg=white guibg=#173c79 guifg=#c5c5c5]]

cmd [[let g:tokyonight_style = "night"]]
cmd [[colorscheme tokyonight]]
