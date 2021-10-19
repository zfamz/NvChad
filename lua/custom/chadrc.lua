-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:
local userPlugins = require "custom.plugins"

M.options = {
   relativenumber = true,
   tabstop = 2,
   smartindent = false,
}

M.mappings = {
   terminal = {
      esc_termmode = { "<esc>" },
   },

}

M.ui = {
   theme = "gruvchad",
}

-- NvChad included plugin options & overrides
M.plugins = {
   status = {
      colorizer = true,
      alpha = true,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   install = userPlugins,
}

return M
