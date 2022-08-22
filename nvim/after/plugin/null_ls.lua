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
  diagnostics.shellcheck,
  formatting.latexindent.with({ extra_args = { "-g", "/dev/null" }}), 
  formatting.prettier.with({
		filetypes = {
			"javascript","typescript","css","scss","html","json","yaml","markdown","graphql","md","txt",
		},
    extra_args = { 
      "--single-quote",
      "--no-semi",
      "--arrow-parens avoid",
      "--end-of-line lf",
      "--tabWidth",
    },
  }),
 }

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
