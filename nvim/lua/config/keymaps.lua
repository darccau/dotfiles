local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<leader>q", ":q!<enter>", opts)
map("n", "<leader>w", ":up<enter>", opts)
map("n", "<leader>a", ":wa<enter>", opts)

map("n", "sh", "<c-w>h", opts)
map("n", "sj", "<c-w>j", opts)
map("n", "sk", "<c-w>k", opts)
map("n", "sl", "<c-w>l", opts)

-- splits
map("n", "ss", "<c-w>s", opts)
map("n", "sv", "<c-w>v", opts)

-- replace % to tab
map({ "n", "v" }, "<tab>", "%", opts)

-- lazygit
map("n", "\\", "<cmd>Fugit2<cr>", opts)

-- obsidian
-- map("n", "<space>b", "<cmd>ObsidianBacklinks<cr>", opts)
-- map("n", "<space>d", "<cmd>ObsidianToday<cr>", opts)
-- map("n", "<space>m", "<cmd>ObsidianTomorrow<cr>", opts)
-- map("n", "<space>y", "<cmd>ObsidianYesterday<cr>", opts)
-- map("n", "<space>s", "<cmd>ObsidianSearch<cr>", opts)
-- map("n", "<space>t", "<cmd>ObsidianTemplate<cr>", opts)

map("n", "<space>e", "<cmd>Neotree toggle<cr>", opts)

-- regex
map("n", "rp", ":%s/\\v", opts)
map("v", "r", ":s/\\%V", { desc = "Search only in visual selection usingb%V atom" })

-- run script
map("v", "x", ":'<,'>!bash -e<CR>", { noremap = true, silent = true })
map("v", "c", ":%! ", { noremap = true, silent = true })
map("n", "<leader>r", ":%w !bash -e <cr>")
map("n", "<leader>c", ":%!")
map("n", "<leader>j", ":%! jq . ")

map("n", "cx", ":!chmod u+x %<cr>", { desc = "make file executable" })

map("n", "te", "<cmd>tabedit<cr>", opts)
map("n", "H", "<cmd>tabprevious<cr>", opts)
map("n", "L", "<cmd>tabnext<cr>", opts)

map("n", "J", "mzJ`z", { desc = "join lines without spaces" })
map("n", "n", "nzzzv", { desc = "keep cursor centered" })
map("n", "N", "Nzzzv", { desc = "keep cursor centered" })

-- add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

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
