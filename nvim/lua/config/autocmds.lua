local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- wrap words "softly" (no carriage return) in mail buffer
api.nvim_create_autocmd("Filetype", {
  pattern = "mail",
  callback = function()
    vim.opt.textwidth = 0
    vim.opt.wrapmargin = 0
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.columns = 80
    vim.opt.colorcolumn = "80"
  end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
  {
    pattern = { "*.txt", "*.md", "*.tex" },
    callback = function()
      vim.opt.spell = true
      vim.opt.spelllang = "en,pt"
    end,
  }
)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")
