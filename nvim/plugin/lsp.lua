local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
    formatting.eslint,
    formatting.black,
    formatting.terraform_fmt,
    formatting.clang_format,
    formatting.gofumpt,
    formatting.goimports,
    -- diagnostics.golangci_lint,
}

null_ls.setup({
	sources = sources,

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
