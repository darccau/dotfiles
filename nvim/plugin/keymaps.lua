-- global keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Considerable maps
-- nmap <Space> <C-w>w

local opts = { noremap = true, silent = true }
local mappings = {
    { "n", "<leader>U", [[<Cmd>PackerSync<CR>]], opts }, -- Update all current plugins
    { "n", "<leader>P", [[<cmd>set spell spelllang=pt<cr>]], opts },
    { "n", "<leader>M", [[<cmd>e ~/.config/nvim/lua/mappings.lua<cr>]], opts },
    { "n", "<leader>S", [[<cmd>e ~/.config/nvim/lua/settings.lua<cr>]], opts },
    { "n", "<leader>I", [[<cmd>e ~/.config/nvim/init.lua<cr>]], opts },
    { "n", "sf", [[:edit .<cr>]], opts },
    { "n", "ss", [[<cmd>split<cr>]], opts },
    { "n", "sv", [[<cmd>vsplit<cr>]], opts },
    { "n", ";n", [[<cmd>noh<cr>]], opts },
    { 'n', 'te', '<cmd>tabedit<return>', opts },
    { 'n', '<leader>h', ':tabprevious<cr>', opts },
    { 'n', '<leader>l', ' :tabnext<cr>', opts },
    { "n", ";e", [[<Cmd>lua require("telescope.builtin").find_files()<cr>]], opts },
    { "n", "<leader>u", ":%! sort -u<cr>", opts },
    { 'n', 'Y', 'y$', opts },
    { 'n', 'n', 'nzzzv', opts },
    { 'n', 'N', 'Nzzzv', opts },
    { 'n', 'J', 'mzJ`z', opts },
    { 'i', ',', ',<c-g>u', opts },
    { 'i', '.', '.<c-g>u', opts },
    { 'i', '!', '!<c-g>u', opts },
    { 'i', '?', ',<c-g>u', opts },
    { 'n', '<leader>i', 'gq<cr>', opts },
    { 'n', ';s', '/', opts },
    { 'n', 'U', '<C-r>', opts },
    { 'n', 'sh', '<C-w>h', opts },
    { 'n', 'sj', '<C-w>j', opts },
    { 'n', 'sk', '<C-w>k', opts },
    { 'n', 'sl', '<C-w>l', opts },
    { 'n', '\\', ':Git<cr>', opts },
    { 'n', ';p', ':Git push<cr>', opts },
    { "n", ";w", [[<cmd>up<cr>]], opts },
    { "n", ";q", [[<cmd>q<cr>]], opts },
    { "n", ";d", [[<cmd>bd<cr>]], opts },
    { 'n', 'e', '$', opts },
    { 'n', 'm', '%', opts },
    { "n", ";a", "<cmd>wa<cr>", opts },
    { 'n', ';<s-tab>', ':BufferPrevious<cr>', opts },
    { 'n', ';<tab>', ':BufferNext<cr>', opts },
    {'n', ';1', ':BufferGoto 1<CR>', opts},
    {'n', ';2', ':BufferGoto 2<CR>', opts},
    {'n', ';3', ':BufferGoto 3<CR>', opts},
    {'n', ';4', ':BufferGoto 4<CR>', opts},
    {'n', ';5', ':BufferGoto 5<CR>', opts},
    {'n', ';6', ':BufferGoto 6<CR>', opts},
    {'n', ';7', ':BufferGoto 7<CR>', opts},
    {'n', ';8', ':BufferGoto 8<CR>', opts},
    {'n', ';9', ':BufferGoto 9<CR>', opts},
    {'n', ';0', ':BufferLast<CR>', opts},
}

for _, map in pairs(mappings) do
    vim.keymap.set(unpack(map))
end

