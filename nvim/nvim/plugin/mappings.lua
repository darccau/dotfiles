-- global keymaps
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local mappings = {
  { "n", "se", "<cmd>setlocal spelllang=en<cr><esc>:setlocal spell<cr>", opts},
  { "n", "sp", "<cmd>setlocal spelllang=pt<cr><esc>:setlocal spell<cr>", opts},
  { "n", "ss", [[<cmd>split<cr>]], opts },
  { "n", "sv", [[<cmd>vsplit<cr>]], opts },
  { "n", "<leader>n", [[<cmd>noh<cr>]], opts },
  { 'n', 'te', '<cmd>tabedit<return>', opts },
  { 'n', 'Y', 'y$', opts },
  { 'n', 'n', 'nzzzv', opts },
  { 'n', 'N', 'Nzzzv', opts },
  { 'n', 'J', 'mzJ`z', opts },
  { 'i', ',', ',<c-g>u', opts },
  { 'i', '.', '.<c-g>u', opts },
  { 'i', '!', '!<c-g>u', opts },
  { 'i', '?', ',<c-g>u', opts },
  { 'n', 'U', '<C-r>', opts },
  { 'n', 'sh', '<C-w>h', opts },
  { 'n', 'sj', '<C-w>j', opts },
  { 'n', 'sk', '<C-w>k', opts },
  { 'n', 'sl', '<C-w>l', opts },
  -- { 'n', '<space>', '<c-w>w', opts },
  { 'n', '\\', ':Neogit<cr>', opts },
  { 'n', '<leader>p', ':Git push<cr>', opts },
  { "n", "<leader>w", [[<cmd>up<cr>]], opts },
  { "n", "<leader>q", [[<cmd>q!<cr>]], opts },
  { "n", "<leader>d", [[<cmd>bd<cr>]], opts },
  { "n", "<leader>a", [[<cmd>wqa!<cr>]], opts },
  { 'n', 'e', '$', opts },
  { 'n', ';', '%', opts },
}

for _, map in pairs(mappings) do
    vim.keymap.set(unpack(map))
end

