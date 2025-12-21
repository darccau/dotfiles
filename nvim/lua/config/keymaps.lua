local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<leader>q", ":q!<enter>", opts)
map("n", "<leader>w", ":up<enter>", opts)
map("n", "<leader>a", ":wa<enter>", opts)

map("n", "sh", "<c-w>h", opts)
map("n", "sj", "<c-w>j", opts)
map("n", "sk", "<c-w>k", opts)
map("n", "sl", "<c-w>l", opts)

map("n", "sp", "<c-w>s", opts)
map("n", "sv", "<c-w>v", opts)

map({ "n", "v" }, "<tab>", "%", opts)

map("n", "<space>e", "<cmd>Neotree toggle<cr>", opts)

map("n", "rp", ":%s/\\v", opts)
map("v", "r", ":s/\\%V", opts)

-- Folding
map("n", "zn", function()
  require("ufo").openAllFolds()
end, opts)
map("n", "zm", function()
  require("ufo").closeAllFolds()
end, opts)

-- run script
map("v", "x", ":'<,'>!bash -e<CR>", opts)
map("v", "c", ":%! ", opts)
map("n", "<leader>r", ":%w !bash -e <cr>", opts)
map("n", "<leader>c", ":%!", opts)
map("n", "<leader>j", ":%! jq . ", opts)

map("n", "cx", ":!chmod u+x %<cr>", opts)

map("n", "te", "<cmd>tabedit<cr>", opts)
map("n", "H", "<cmd>tabprevious<cr>", opts)
map("n", "L", "<cmd>tabnext<cr>", opts)

map("n", "J", "mzJ`z", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- add undo break-points
map("i", ",", ",<c-g>u", opts)
map("i", ".", ".<c-g>u", opts)
map("i", ";", ";<c-g>u", opts)

-- better home/end movementation
map({ "n", "x", "o" }, "e", "g_", opts)

map("n", "<leader>n", "<cmd>nohlsearch<cr>", opts)

-- fuzzy
map("n", "st", "<cmd>TodoTelescope<cr>", opts)
map("n", "sb", "<cmd>Telescope buffers<cr>", opts)
map("n", "sf", "<cmd>Telescope find_files<cr>", opts)
map("n", "sr", "<cmd>Telescope live_grep<cr>", opts)
map("n", "sm", "<cmd>Telescope lsp_references<cr>", opts)
map("n", "sd", "<cmd>Telescope lsp_definitions<cr>", opts)
map("n", "se", "<cmd>Telescope diagnostics<cr>", opts)
map("n", "sg", "<cmd>Telescope git_status<cr>", opts)

-- write mode
map("n", "<leader>z", "<cmd>ZenMode<cr>", opts)
