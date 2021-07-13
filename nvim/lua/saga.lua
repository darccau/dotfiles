local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

--vim.api.nvim_set_keymap("n", "<silent> <C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opt)
--vim.api.nvim_set_keymap("n", "<silent>K", "<Cmd>Lspsaga hover_doc<CR>", opt)
--vim.api.nvim_set_keymap("n", "<silent> <C-k>", "<Cmd>Lspsaga signature_help<CR>", opt)
--vim.api.nvim_set_keymap("n", "<silent> gh", "<Cmd>Lspsaga lsp_finder<CR>", opt)
