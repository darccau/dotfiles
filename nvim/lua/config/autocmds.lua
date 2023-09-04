-- Define local variables
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing whitespaces
autocmd("BufWritePre", {
  callback = function()
    vim.cmd("%s/\\s\\+$//e")
  end,
})

-- Highlight text on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "700" })
  end,
})

-- Automatically rebalance windows on vim resize
autocmd("VimResized", {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Never insert line as a comment when using 'o' to enter insert mode
autocmd("BufWinEnter", {
  callback = function()
    vim.cmd("setlocal formatoptions-=o")
  end,
})

-- Close man and help with just <q>
autocmd("FileType", {
  pattern = { "help", "man", "lspinfo", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto create dir when saving a file where some intermediate directory does not exist
autocmd("BufWritePre", {
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Go to the last loc when opening a buffer
autocmd("BufReadPost", {
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Check if the file needs to be reloaded when it's changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  callback = function()
    vim.cmd.checktime()
  end,
})

-- Set cmdheight to 1 when recording, and put it back to normal when it stops
autocmd("RecordingEnter", {
  callback = function()
    vim.opt_local.cmdheight = 1
  end,
})

autocmd("RecordingLeave", {
  callback = function()
    vim.opt_local.cmdheight = 0
  end,
})
