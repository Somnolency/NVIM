-- Just an example, supposed to be placed in /lua/custom/

local M = {}
local userPlugins = require "custom.plugins"
local map = require("core.utils").map

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvchad",
}

M.plugins = {
   user = userPlugins,
}

M.mappings = {
   misc = function ()
      require "custom.mappings"
   end,
}
return M
