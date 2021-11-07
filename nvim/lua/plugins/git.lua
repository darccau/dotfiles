local neogit = require("neogit")

neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  auto_refresh = true,
  disable_builtin_notifications = false,
  commit_popup = {
    kind = "split",
  },
  kind = "tab"
}
signs = {
  section = { ">", "v" },
  item = { ">", "v" },
  hunk = { "", "" },
}
sections = {
  untracked = {
    folded = false
  },
  unstaged = {
    folded = false
  },
  staged = {
    folded = false
  },
  stashes = {
    folded = true
  },
  unpulled = {
    folded = true
  },
  unmerged = {
    folded = false
  },
  recent = {
    folded = true
  },
}
mappings = {
  status = {
    ["B"] = "BranchPopup",
    ["s"] = "",
  }
}

