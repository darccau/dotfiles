 local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- copy til the end of line 
map('n', 'Y', 'y$', opt)

-- searching centered
map('n', 'n', 'nzzzv', opt)
map('n', 'N', 'Nzzzv', opt)
map('n', 'J', 'mzJ`z', opt)

-- jumplist mutations
--map('n', '<expr>k', '(v:count > 5 ? "m'" . v:count : "") . 'k'', opt)
--map('n', '<expr>j', '(v:count > 5 ? "m'" . v:count : "") . 'j'', opt)

-- undo break points
map('i', ',', ',<c-g>u', opt)
map('i', '.', '.<c-g>u', opt)
map('i', '!', '!<c-g>u', opt)
map('i', '?', ',<c-g>u', opt)

-- toggle numbers ---
map('n', '<leader>n', [[ <Cmd> set nu!<CR>]], opt)

-- Commenter Keybinding
map('n', '<leader>;', ':CommentToggle<CR>', {noremap = true, silent = true})
map('v', '<leader>;', ':CommentToggle<CR>', {noremap = true, silent = true})

-- Command mode alternative key
map('n', ';', ':')

-- Text identation
map('n', '<leader>i', 'gq<cr>')

map('i', 'jk', '<esc>')
map('i', 'kj', '<esc>')

-- Clear search highligh
map('n', '<leader>a', ':noh<return>')
map('n', '<leader>s', '/')

-- Quick quit
map('n', '<leader>q', ':quit<return>')

-- Quick save
map('n', '<leader>w', ':up<return>')

map('n', '<leader>ev', ':e $MYVIMRC<return>')
map('n', '<leader>ez', ':e $MYZSHRC<return>')
map('n', '<leader>et', ':e $MYTMUXCONFIG<return>')

map('n', '<leader>g', ':Neogit<cr>')

map('n', 'U', '<C-r>')

map('n', 'ss', '<C-w>s<return>')
map('n', 'sv', '<C-w>v<return>')

map('n', 'sh', '<C-w>h')
map('n', 'sj', '<C-w>j')
map('n', 'sk', '<C-w>k')
map('n', 'sl', '<C-w>l')

map('n', '<leader>dd', ':bd<cr>')

map('n', 'te', ':tabedit<return>')
map('n', '<Tab>', ':tabnext<return>')
map('n', '<S-Tab>', ':tabprev<return>')

-- Resize
map('n', '<C-w><left>', '<C-w><')
map('n', '<C-w><right>', '<C-w>>')
-- map('n', '<C-w><up>', '<C-w>+')
-- map('n', '<C-w><down>', '<C-w>-')

map('n', '<leader>h', ':bfirst<return>')
map('n', '<leader>j', ':bprevious<return>')
map('n', '<leader>k', ':bnext<return>')
map('n', '<leader>l', ':blast<return>')

map('n', '<silent>K', [[ <Cmd> Lspsaga hover_doc<CR> ]], opt)
map('n', '<C-k>', [[ <Cmd> Lspsaga signature_help<CR>]], opt)
map('n', 'gh', [[ <Cmd> Lspsaga lsp_finder<CR>]], opt)
