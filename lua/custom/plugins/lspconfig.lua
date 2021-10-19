local M = {}

M.setup_lsp = function(_attach, capabilities)
   local lspconfig = require "lspconfig"
   local lsp_installer = require "nvim-lsp-installer"

   local attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      _attach(client, bufnr)
   end

   -- lspservers with default config

   local servers = { "tsserver", "html", "cssls", "volar", "jsonls", "rust_analyzer" }

   for _, name in pairs(servers) do
      local ok, server = lsp_installer.get_server(name)
      if ok then
         if not server:is_installed() then
            print("Installing " .. name)
            server:install()
         end
      end
   end

   lsp_installer.on_server_ready(function(server)
      if server.name == "tsserver" then
         local opts = {
            on_attach = attach,
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern "package.json",
         }
         server:setup(opts)
      elseif server.name == "rust_analyzer" then
         local opts = {
            on_attach = attach,
            capabilities = capabilities,
            settings = {
               experimental = {
                  procAttrMacros = true,
               },
               checkOnSave = {
                  command = "clippy",
               },
            },
         }
         server:setup(opts)
      else
         local opts = {
            on_attach = attach,
            capabilities = capabilities,
         }
         server:setup(opts)
      end
   end)

   -- for _, lsp in ipairs(servers) do
   --    lspconfig[lsp].setup {
   --       on_attach = attach,
   --       capabilities = capabilities,
   --       flags = {
   --          debounce_text_changes = 150,
   --       },
   --    }
   -- end

   -- lspconfig.tsserver.setup {
   --    on_attach = function(client, bufnr)
   --       client.resolved_capabilities.document_formatting = false
   --       vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
   --    end,
   -- }
end

return M
