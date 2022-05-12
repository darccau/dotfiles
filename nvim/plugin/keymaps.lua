-- global keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local mappings = {
    { "n", "<leader>U", [[<Cmd>PackerSync<CR>]], opts }, -- Update all current plugins
    { "n", "<leader>c", [[<Cmd>cclose<CR>]], opts }, -- close quickfix list
    { "v", "<", [[<gv]], opts }, -- move code forward in visual mode
    { "v", ">", [[>gv]], opts }, -- move code backwards in visual mode
    { "n", "<leader>n", [[<Cmd>cn<CR>]], opts }, -- move to next item in quickfix list
    { "n", "<leader>p", [[<Cmd>cp<CR>]], opts }, -- move to prev item in quickfix list
    { "n", "<leader>U", [[<cmd>PackerSync<cr>]], opts },
    { "n", "<leader>P", [[<cmd>set spell spelllang=pt<cr>]], opts },
    { "n", "sc", [[:%!]], opts },
    { "n", "<leader>M", [[<cmd>e ~/.config/nvim/lua/mappings.lua<cr>]], opts },
    { "n", "<leader>S", [[<cmd>e ~/.config/nvim/lua/settings.lua<cr>]], opts },
    { "n", "<leader>I", [[<cmd>e ~/.config/nvim/init.lua<cr>]], opts },
    { "n", "<leader>a", [[<cmd>noh<cr>]], opts },
    { "n", "<leader>h", [[<cmd>tabprevious<cr>]], opts },
    { "n", "<leader>l", [[<cmd>tabnext<cr>]], opts },
    { "n", "<leader>j", [[<cmd>bp<cr>]], opts },
    { "n", "<leader>k", [[<cmd>bn<cr>]], opts },
    { "n", "<leader>d", [[<cmd>bd<cr>]], opts },
    { "n", "sf", [[:edit .<cr>]], opts },
    { "n", "ss", [[<cmd>split<cr>]], opts },
    { "n", "<leader>r", [[<cmd>GoRun %<cr>]], opts },
    { "n", "sv", [[<cmd>vsplit<cr>]], opts },
    { 'n', 'te', '<cmd>tabedit<return>', opts },
    { "n", "<leader>w", [[<Cmd>up<cr>]], opts },
    { "n", "<leader>q", [[<Cmd>q<cr>]], opts },
    { "n", "\\", [[<cmd>Neogit<cr>]], opts },
    { "n", "<leader>g", [[<Cmd>lua require("telescope.builtin").live_grep()<cr>]], opts },
    { "n", "<leader>e", [[<Cmd>lua require("telescope.builtin").find_files()<cr>]], opts },
    { "n", ";", ":", opts },
    { "n", [[<leader>u]], ":%! sort -uV<cr>", opts },
    { 'n', 'Y', 'y$', opts },
    { 'n', 'n', 'nzzzv', opts },
    { 'n', 'N', 'Nzzzv', opts },
    { 'n', 'J', 'mzJ`z', opts },
    { 'i', ',', ',<c-g>u', opts },
    { 'i', '.', '.<c-g>u', opts },
    { 'i', '!', '!<c-g>u', opts },
    { 'i', '?', ',<c-g>u', opts },
    { 'n', '<leader>i', 'gq<cr>', opts },
    { 'n', '<leader>s', '/', opts },
    { 'n', 'U', '<C-r>', opts },
    { 'n', 'sh', '<C-w>h', opts },
    { 'n', 'sj', '<C-w>j', opts },
    { 'n', 'sk', '<C-w>k', opts },
    { 'n', 'sl', '<C-w>l', opts },
    { 'n', 'e', '$', opts },
    { 'n', 'm', '%', opts },
}

for _, map in pairs(mappings) do
    vim.keymap.set(unpack(map))
end
