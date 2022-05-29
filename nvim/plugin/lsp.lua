local ok, _ = pcall(require, "nvim-lsp-installer")
if not ok then
    return
end
local servers = require("nvim-lsp-installer.servers")

local ok, nls = pcall(require, "null-ls")
if not ok then
    return
end

local function on_attach(client, bufnr)
    local opts = { silent = true, noremap = true }
    local mappings = {
        { "n", "gD", [[<Cmd>lua vim.lsp.buf.declaration()<CR>]], opts },
        { "n", "gd", [[<Cmd>lua vim.lsp.buf.definition()<CR>]], opts },
        { "n", "gr", [[<Cmd>lua vim.lsp.buf.rename()<CR>]], opts },
        {
            "n",
            "<leader>gR",
            "<cmd>TroubleToggle lsp_references<CR>",
            opts,
        },
        {
            "i",
            "<C-x>",
            [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]],
            opts,
        },
        {
            "n",
            "[e",
            [[<Cmd>lua vim.diagnostic.goto_next()<CR>]],
            opts,
        },
        {
            "n",
            "]e",
            [[<Cmd>lua vim.diagnostic.goto_prev()<CR>]],
            opts,
        },
    }

    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", [[<Cmd>lua vim.lsp.buf.hover()<CR>]], opts)

    for _, map in pairs(mappings) do
        vim.api.nvim_buf_set_keymap(bufnr, unpack(map))
    end

    -- format on save
    if client.resolved_capabilities.document_formatting then
        local lsp_formatting_group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "<buffer>",
            group = lsp_formatting_group,
            callback = function()
                vim.lsp.buf.formatting_seq_sync()
            end,
        })
    end


-- lsp servers
local required_servers = {
    "sumneko_lua", -- lua
    "pyright", -- python
    "tsserver", -- js, jsx, tsx
    "bashls", -- bash
    "yamlls", -- yaml
    "vimls", -- vim
    "jsonls", -- json
    "sqlls", -- sql
    "terraformls", -- terraform
}

-- configuring null-ls for formatters
local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local actions = nls.builtins.code_actions

    nls.setup({
        sources = {
            formatting.prettier.with({
                filetypes = { "html", "json", "markdown", "toml" },
            }),
            formatting.shfmt,
            formatting.stylua.with({
                condition = function(utils)
                    return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
                end,
            }),
            formatting.latexindent,
            formatting.black,
            formatting.terrafmt,
            formatting.goimports,
            diagnostics.golangci_lint,
            diagnostics.yamllint,
            diagnostics.shellcheck,
            actions.shellcheck,
        },
    })
end
