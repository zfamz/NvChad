local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local b = null_ls.builtins

local sources = {

   -- JS html css stuff
   b.formatting.prettierd.with {},
   b.diagnostics.eslint_d,

   -- rust
   b.formatting.rustfmt,

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local on_attach = function(client)
   -- if client.resolved_capabilities.document_formatting then
   --    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
   -- end
end

local M = {}

M.setup = function()
   null_ls.setup {
      sources = sources,
      on_attach = on_attach,
   }
end

return M
