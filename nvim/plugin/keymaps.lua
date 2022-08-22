-- global keymaps
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

local opts = { noremap = true, silent = true }
local mappings = {
  -- { "n", "<leader>U", [[<Cmd>PackerSync<CR>]], opts }, -- Update all current plugins
  -- { "n", "<leader>P", [[<cmd>set spell spelllang=pt<cr>]], opts },
  -- { "n", "<leader>M", [[<cmd>e ~/.config/nvim/lua/mappings.lua<cr>]], opts },
  -- { "n", "<leader>S", [[<cmd>e ~/.config/nvim/lua/settings.lua<cr>]], opts },
  -- { "n", "<leader>I", [[<cmd>e ~/.config/nvim/init.lua<cr>]], opts },
  { "n", "se", "<cmd>setlocal spelllang=en<cr><esc>:setlocal spell<cr>", opts},
  { "n", "sp", "<cmd>setlocal spelllang=pt<cr><esc>:setlocal spell<cr>", opts},
  { "n", "ns", "<cmd>setlocal nospell<cr>", optts},
  { "n", "sf", [[:edit .<cr>]], opts },
  { "n", "ss", [[<cmd>split<cr>]], opts },
  { "n", "sv", [[<cmd>vsplit<cr>]], opts },
  { "n", "<leader>n", [[<cmd>noh<cr>]], opts },
  { 'n', 'te', '<cmd>tabedit<return>', opts },
  -- { "n", "<leader>u", ":%! sort -u<cr>", opts },
  { 'n', 'Y', 'y$', opts },
  { 'n', 'n', 'nzzzv', opts },
  { 'n', 'N', 'Nzzzv', opts },
  { 'n', 'J', 'mzJ`z', opts },
  { 'i', ',', ',<c-g>u', opts },
  { 'i', '.', '.<c-g>u', opts },
  { 'i', '!', '!<c-g>u', opts },
  { 'i', '?', ',<c-g>u', opts },
  -- { 'n', '<leader>i', 'gq<cr>', opts },
  { 'n', '<leader>s', '/', opts },
  { 'n', 'U', '<C-r>', opts },
  { 'n', 'sh', '<C-w>h', opts },
  { 'n', 'sj', '<C-w>j', opts },
  -- { 'n', '<leader>', '<cmd>make run', opts },
  { 'n', 'sk', '<C-w>k', opts },
  { 'n', 'sl', '<C-w>l', opts },
  { 'n', '<space>', '<c-w>w', opts },
  { 'n', '\\', ':Git<cr>', opts },
  { 'n', '<leader>p', ':Git push<cr>', opts },
  { "n", "<leader>w", [[<cmd>up<cr>]], opts },
  { "n", "<leader>q", [[<cmd>q<cr>]], opts },
  { "n", "<leader>d", [[<cmd>bd<cr>]], opts },
  { "n", "<leader>a", [[<cmd>wa<cr>]], opts },
  { 'n', 'e', '$', opts },
  { 'n', 'm', '%', opts },
  { 'n', '<leader><s-tab>', ':BufferPrevious<cr>', opts },
  { 'n', '<leader><tab>', ':BufferNext<cr>', opts },
  {'n', '<leader>1', ':BufferGoto 1<CR>', opts},
  {'n', '<leader>2', ':BufferGoto 2<CR>', opts},
  {'n', '<leader>3', ':BufferGoto 3<CR>', opts},
  {'n', '<leader>4', ':BufferGoto 4<CR>', opts},
  {'n', '<leader>5', ':BufferGoto 5<CR>', opts},
  {'n', '<leader>6', ':BufferGoto 6<CR>', opts},
  {'n', '<leader>7', ':BufferGoto 7<CR>', opts},
  {'n', '<leader>8', ':BufferGoto 8<CR>', opts},
  {'n', '<leader>9', ':BufferGoto 9<CR>', opts},
  {'n', '<leader>0', ':BufferLast<CR>', opts},
}

for _, map in pairs(mappings) do
    vim.keymap.set(unpack(map))
end

