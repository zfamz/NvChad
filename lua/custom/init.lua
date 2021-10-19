-- This is an example init file , its supposed to be placed in /lua/custom/

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

--------------------------------------------------------------------
local g = vim.g
local opt = vim.opt
local api = vim.api

g.highlightedyank_highlight_duration = 100
g.did_load_filetypes = 1

opt.scrolloff = 10
opt.swapfile = false
-- opt.cindent = true
-- opt.fileformats = "unix"

api.nvim_set_var("sneak#label", 1)

-- MAPPINGS
local map = require("core.utils").map
map("n", ";", ":", { silent = false })
map("n", "<leader>rc", ":tabe $MYVIMRC<cr>:cd %:p:h<cr>")
map("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")
map("n", "<leader>wt", ":!start wt<cr><cr>")
map("n", "<leader>fm", ":lua vim.lsp.buf.formatting_sync()<cr>")
map("n", "<leader>dgd", ":lua vim.diagnostic.disable()<cr>")
map("n", "<leader>dge", ":lua vim.diagnostic.enable()<cr>")
map("v", "J", ":m '>+1<cr>gv")
map("v", "K", ":m '<-2<cr>gv")

local isUnix = vim.fn.has('unix') == 1

if isUnix then
   function bgTransparent()
      api.nvim_command("hi Normal guibg=NONE ctermbg=NONE")
      api.nvim_command("hi NvimTreeNormal guibg=NONE ctermbg=NONE")
      -- vim.cmd("au VimEnter * hi Normal guibg=NONE")
      -- vim.cmd("au VimEnter * hi NvimTreeNormal guibg=NONE")
   end
   map("n", "<leader>bg", ":lua bgTransparent()<cr>")
   map("n", "<leader>lg", ":LazyGit<cr>")
   map("n", "<leader>ra", ":RnvimrToggle<cr>")
   map("n", "<leader>tr", ":RnvimrToggle<cr>")
end

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
