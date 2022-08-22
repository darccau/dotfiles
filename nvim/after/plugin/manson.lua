local status_manson_ok, manson = pcall(require, "manson")
if (not manson_ok) then return end

require("mason").setup({
ui = {
    icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
    }
}
})
