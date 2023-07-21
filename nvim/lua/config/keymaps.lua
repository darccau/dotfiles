local opts = { silent = true }
 vim.keymap.set("n", "<leader>q", ":q<enter>", opts)
 vim.keymap.set("n", "<leader>w", ":up<enter>", opts)
 vim.keymap.set("n", "<leader>a", ":wa<enter>", opts)
 vim.keymap.set("n", "sh", "<c-w>h", opts)
 vim.keymap.set("n", "sj", "<c-w>j", opts)
 vim.keymap.set("n", "sk", "<c-w>k", opts)
 vim.keymap.set("n", "sl", "<c-w>l", opts)
 vim.keymap.set("n", "ss", "<c-w>s", opts)
 vim.keymap.set("n", "sv", "<c-w>v", opts)
 vim.keymap.set("n", "<tab>", "%", opts)
 vim.keymap.set("n", "<leader>n", ":noh<enter>", opts)

vim.keymap.set("n", "<leader>f", ":Telescope find_files<cr>", opts)
--vim.keymap.set("n", "<leader>fF", false },
--vim.keymap.set("n", "<leader>gf", Util.telescope("files", { cwd = false }), desc = "Git Files" },
--vim.keymap.set("n", "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Grep" },
--vim.keymap.set("n", "<leader>/", "<leader>sg", remap = true, desc = "Grep" },
--vim.keymap.set("n", "<leader>sG", false },
--vim.keymap.set("n", "<leader>sw", Util.telescope("grep_string", { cwd = false }), desc = "Word" },
--vim.keymap.set("n", "<leader>sW", false },
--vim.keymap.set("n", "<leader>fR", false },
-- vim.keymap.set("n", "<tab>", "%", opts)
-- vim.keymap.set("n", "%", opts )
-- vim.keymap.set("n", "db", 'vb"_d', opts)
-- vim.keymap.set("n", "<c-a>", "gg<s-v>G", opts)
-- vim.keymap.set("n", "e", "<end>", opts)
-- vim.keymap.set("n", "te", ":tabnew<cr>", opts)
-- vim.keymap.set("n", "<leader>n", ":noh<cr>", opts)

