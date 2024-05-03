local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<leader>q", ":q<enter>", opts)
map("n", "<leader>w", ":up<enter>", opts)
map("n", "<leader>a", ":wa<enter>", opts)

-- zenmode
map("n", "<leader>z", "<cmd>ZenMode<enter>", opts)

-- splits movments
map("n", "sh", "<c-w>h", opts)
map("n", "sj", "<c-w>j", opts)
map("n", "sk", "<c-w>k", opts)
map("n", "sl", "<c-w>l", opts)

-- splits
map("n", "ss", "<c-w>s", opts)
map("n", "sv", "<c-w>v", opts)

-- match
map("n", "<tab>", "%", opts)

-- lazygit
map("n", "\\", ":LazyGit<enter>", opts)

-- obsidian
map("n", "<space>o", "<cmd>ObsidianOpen<cr>", opts)
map("n", "<space>b", "<cmd>ObsidianBacklinks<cr>", opts)
map("n", "<space>d", "<cmd>ObsidianToday<cr>", opts)
map("n", "<space>m", "<cmd>ObsidianTomorrow<cr>", opts)
map("n", "<space>y", "<cmd>ObsidianYesterday<cr>", opts)
map("n", "<space>s", "<cmd>ObsidianSearch<cr>", opts)
map("n", "<space>t", "<cmd>ObsidianTemplate<cr>", opts)

-- file explore
map("n", "<space>e", "<cmd>Neotree<cr>", opts)

-- clear search with <esc>
map({ "i", "n" }, "<leader>n", "<cmd>noh<cr><esc>", opts)

-- add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- sort
map("v", "<leader>j", ":'<,'>!jq<CR>", opts)
map("v", "<leader>d", ":'<,'>!jwtd<CR>", opts)

-- run macro on visual block
map("v", "<leader>m", ":'<,'> norm @q<CR>", opts)

-- better home/end movementation
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- fuzzy
map("n", "<leader>t", "<cmd>TodoTelescope<cr>", opts)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>r", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>e", "<cmd>Telescope diagnostics<cr>", opts)
map("n", "<leader>g", "<cmd>Telescope git_status<cr>", opts)

map("n", "<leader>s", "<cmd>Telescope treesitter<cr>", opts)
map("n", "<leader>;", "<cmd>Telescope resume<cr>", opts)

-- Actions
map({ "n", "v" }, "<space>s", "<cmd>Gitsigns stage_hunk<cr>", opts)
map("n", "<space>u", "<cmd>Gitsigns undo_stage_hunk<cr>", opts)
map("n", "<space>p", "<cmd>Gitsigns preview_hunk<cr>", opts)
