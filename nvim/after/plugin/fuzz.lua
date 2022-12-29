local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

local file_browser_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
    },
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd("normal vbd")
          end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["n"] = file_browser_actions.create,
          ["h"] = file_browser_actions.goto_parent_dir,
          -- ["l"] = file_browser_actions.toggle_browser,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
        },
      },
    },
  },
})

telescope.load_extension("file_browser")

vim.keymap.set("n", "<leader>f", function()
  builtin.find_files({
    no_ignore = false,
    hidden = true,
  })
end)
vim.keymap.set("n", "<leader>r", function()
  builtin.live_grep()
end)
-- vim.keymap.set('n', '\\\\', function()
--   builtin.buffers()
-- end)
-- vim.keymap.set('n', '<leader>t', function()
--   builtin.help_tags()
-- end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
-- vim.keymap.set('n', '<leader>e', function()
--   builtin.diagnostics()
-- end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end)
