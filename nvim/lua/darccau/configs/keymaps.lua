-- global keymaps
local opts = { remap = false, silent = true }
local mappings = {
  -- Deletion breakpoints
  { "i", ",", ",<c-g>u", opts },
  { "i", ".", ".<c-g>u", opts },
  { "i", "!", "!<c-g>u", opts },
  { "i", "?", ",<c-g>u", opts },

  -- splits motions
  { "n", "ss", "<cmd>split<cr>", opts },
  { "n", "sv", "<cmd>vsplit<cr>", opts },

  -- splits motions
  { "n", "<Space>", "<C-w>w" },
  { "n", "sh", "<C-w>h", opts },
  { "n", "sj", "<C-w>j", opts },
  { "n", "sk", "<C-w>k", opts },
  { "n", "sl", "<C-w>l", opts },

  -- common operations
  { "n", "<leader>w", [[<cmd>up<cr>]], opts },
  { "n", "<leader>q", [[<cmd>q!<cr>]], opts },
  { "n", "<leader>d", [[<cmd>bd<cr>]], opts },
  { "n", "<leader>a", [[<cmd>wa!<cr>]], opts },

  -- real gangsta
  { { "n", "v" }, "e", "$", opts },
  { "n", "<tab>", "%", opts },
  { "n", "Y", "y$", opts },
  { "n", "<C-a>", "gg<S-v>G" },
  { "n", "<leader>n", [[<cmd>noh<cr>]], opts },
  { "n", "te", "<cmd>tabedit<cr>", opts },
  { "v", "<leader>b", "<cmd>'<,'>!base64 -d<CR>", opts },
  { "n", "<leader>u", "<cmd>%! sort -u --version-sort<cr>", options },

  -- easify
  { "n", "<C-d>", "<C-d>zz", opts },
  { "n", "<C-u>", "<C-u>zz", opts },
  { "n", "n", "nzzzv", opts },
  { "n", "N", "Nzzzv", opts },
  { "n", "J", "mzJ`z", opts },
  { "n", "U", "<C-r>", opts },

  -- resize
  -- {"n", "<C-h>", "<C-w><", opts},
  -- {"n", "<C-l>", "<C-w>>", opts},
  -- {"n", "<C-k>", "<C-w>+", opts},
  -- {"n", "<C-j>", "<C-w>-", opts},
}

for _, map in pairs(mappings) do
  vim.keymap.set(unpack(map))
end
