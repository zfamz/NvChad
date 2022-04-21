local M = {

   {
      "machakann/vim-highlightedyank",
      "tpope/vim-surround",
      "gcmt/wildfire.vim",
      -- "phaazon/hop.nvim"
      "justinmk/vim-sneak",
      "dstein64/vim-startuptime",
      "mattn/emmet-vim",
      "williamboman/nvim-lsp-installer",
      -- after = "nvim-lspconfig",
   },

   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null_ls").setup()
      end,
   },

   {
      "folke/which-key.nvim",
      -- disable = true,
      config = function()
         require("which-key").setup {}
      end,
   },

   {
      "luukvbaal/stabilize.nvim",
      config = function()
         require("stabilize").setup()
      end,
   },
}

local isUnix = vim.fn.has "unix" == 1

if isUnix then
   table.insert(M, {
      "kdheepak/lazygit.nvim",
      "kevinhwang91/rnvimr",
   })
end

return M
