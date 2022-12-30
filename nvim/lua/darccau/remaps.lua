vim.g.mapleader = ";"
local opts = { noremap = true, silent = true }

-- Set language correction
vim.keymap.set("n", "le", "<cmd>setlocal spelllang=en<cr><esc>:setlocal spell<cr>", opts)
vim.keymap.set("n", "lp", "<cmd>setlocal spelllang=pt<cr><esc>:setlocal spell<cr>", opts)

-- Deletion breakpoints
vim.keymap.set("i", ",", ",<c-g>u", opts)
vim.keymap.set("i", ".", ".<c-g>u", opts)
vim.keymap.set("i", "!", "!<c-g>u", opts)
vim.keymap.set("i", "?", ",<c-g>u", opts)

-- splits motions
vim.keymap.set("n", "<Space>", "<C-w>w")
vim.keymap.set("n", "sh", "<C-w>h", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)

-- common operations
vim.keymap.set("n", "<leader>w", [[<cmd>up<cr>]], opts)
vim.keymap.set("n", "<leader>q", [[<cmd>q!<cr>]], opts)
vim.keymap.set("n", "<leader>d", [[<cmd>bd<cr>]], opts)
vim.keymap.set("n", "<leader>a", [[<cmd>wa!<cr>]], opts)

-- real gangsta
vim.keymap.set({ "n", "v" }, "e", "$", opts)
vim.keymap.set("n", "<tab>", "%", opts)
vim.keymap.set("n", "Y", "y$", opts)
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
vim.keymap.set("n", "<leader>n", [[<cmd>noh<cr>]], opts)
vim.keymap.set("n", "te", "<cmd>tabedit<cr>", opts)
vim.keymap.set("v", "<leader>b", "<cmd>'<,'>!base64 -d<CR>")
vim.keymap.set("n", "<leader>u", "<cmd>%! sort -u --version-sort<cr>")

-- easify
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "U", "<C-r>", opts)

-- resize
vim.keymap.set("n", "<C-h>", "<C-w><")
vim.keymap.set("n", "<C-l>", "<C-w>>")
vim.keymap.set("n", "<C-k>", "<C-w>+")
vim.keymap.set("n", "<C-j>", "<C-w>-")
