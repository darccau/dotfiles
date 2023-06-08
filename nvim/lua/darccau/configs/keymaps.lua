-- global keymaps
local options = { remap = false, silent = true }
local mappings = {

  -- splits motions
  { "n", "ss", "<cmd>split<enter>", options },
  { "n", "sv", "<cmd>vsplit<enter>", options },

  -- splits motions
  { "n", "<space>", "<C-w>w", options },
  { "n", "sh", "<C-w>h", options },
  { "n", "sj", "<C-w>j", options },
  { "n", "sk", "<C-w>k", options },
  { "n", "sl", "<C-w>l", options },

  -- common operations
  { "n", "<leader>w", "<cmd>up<enter>", options },
  { "n", "<leader>q", "<cmd>q!<enter>", options },
  { "n", "<leader>d", "<cmd>bd<enter>", options },
  { "n", "<leader>a", "<cmd>wa!<enter>", options },

  -- real gangsta
  { { "n", "v" }, "e", "$", options },
  { "n", "\\", "<cmd>Git<enter>", options },
  { "n", "<tab>", "%", options },
  { "n", "Y", "y$", options },
  { "n", "<C-a>", "gg<S-v>G" },
  { "n", "<leader>n", "<cmd>noh<enter>", options },
  { "n", "te", "<cmd>tabedit<enter>", options },
  { "n", "<leader>u", "<cmd>%! sort -u --version-sort<enter>", options },

  -- easify
  { "n", "<C-d>", "<C-d>zz", options },
  { "n", "<C-u>", "<C-u>zz", options },
  { "n", "n", "nzzzv", options },
  { "n", "N", "Nzzzv", options },
  { "n", "J", "mzJ`z", options },
  { "n", "U", "<C-r>", options },

  -- Deletion breakpoints
  { "i", ",", ",<c-g>u", options },
  { "i", ".", ".<c-g>u", options },
  { "i", "!", "!<c-g>u", options },
  { "i", "?", ",<c-g>u", options },
}

for _, map in pairs(mappings) do
  vim.keymap.set(unpack(map))
end
