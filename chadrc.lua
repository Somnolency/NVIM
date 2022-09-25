local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "onenord_light",
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M