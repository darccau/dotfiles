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

map("n", "cx", ":!chmod u+x %<cr>", opts)

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

-- Code review
map("n", "sd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
map("n", "sr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
map("n", "si", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

-- fuzzy
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>m", "<cmd>Telescope lsp_references<cr>", opts)
map("n", "<leader>d", "<cmd>Telescope lsp_definitions<cr>", opts)

-- write mode
map("n", "<leader>z", "<cmd>ZenMode<cr>", opts)
