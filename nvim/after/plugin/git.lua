local status, git = pcall(require, "neogit")
if not status then
  return
end

git.setup({
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  kind = "tab",
  commit_popup = {
    kind = "split",
  },
  popup = {
    kind = "split",
  },
  signs = {
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
})
