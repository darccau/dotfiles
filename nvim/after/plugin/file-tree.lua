local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
  show_hidden_files = false,
  devicons_enable = true,
  mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    --['K']     = actions.mkdir,
    ['n']     = actions.mkdir,
    --['N']     = actions.newfile,
    ['a']     = actions.newfile,
    --['R']     = actions.rename,
    ['r']     = actions.rename,
    ['@']     = actions.cd,
    --['Y']     = actions.yank_path,
    ['y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    --['D']     = actions.delete,
    ['d']     = actions.delete,

    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    --['C'] = clipboard_actions.copy,
    ['c'] = clipboard_actions.copy,
    --['X'] = clipboard_actions.cut,
    ['x'] = clipboard_actions.cut,
    --['P'] = clipboard_actions.paste,
    ['p'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = false
    },
  },
  hide_cursor = true,
  on_init = function()
    -- use visual mode
    vim.api.nvim_buf_set_keymap(
      0,
      "x",
      "J",
      ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
      { noremap = true, silent = true }
    )

    -- echo cwd
    vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
  end,
}
