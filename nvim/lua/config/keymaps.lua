local function map(mode, lhs, rhs, desc, opts)
  local options = { noremap = true, silent = true, desc = desc }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<leader>q", ":q<enter>")
map("n", "<leader>w", ":up<enter>")
map("n", "<leader>a", ":wa<enter>")
map("n", "sh", "<c-w>h")
map("n", "e", "<end>")
map("n", "sj", "<c-w>j")
map("n", "<leader>z", "<cmd>ZenMode<enter>")
map("n", "sk", "<c-w>k")
map("n", "sl", "<c-w>l")
map("n", "ss", "<c-w>s")
map("n", "sv", "<c-w>v")
map("n", "<tab>", "%")
map("n", "<leader>n", ":noh<enter>")
map("n", "\\", ":LazyGit<enter>")
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", "go to previous diagnostic message")
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", "go to next diagnostic message")
map({ "n", "v" }, "<leader>r", "<cmd>Lspsaga rename<cr>", "rename symbol")
