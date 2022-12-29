local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local sources = {
  formatting.eslint,
  formatting.black,
  diagnostics.golangci_lint,
  formatting.stylua,
  formatting.terraform_fmt,
  formatting.gofmt,
  formatting.goimports,
  formatting.latexindent.with({ extra_args = { "-g", "/dev/null" } }),
  diagnostics.yamllint.with({
    extra_args = { "-d", "{extends: relaxed, rules: {line-length: {max: 200}}}" },
  }),
  formatting.prettier.with({
    filetypes = {
      "javascript",
      "typescript",
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql",
      "md",
      "txt",
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
    -- Alter this shit ->
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
