M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvchad",
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M

--[[
   下面是M的内容格式
{
  mappings = {
    NvimTreeToggle = {
      n = {
        ["<leader>m"] = { "<cmd>NvimTreeToggle<CR>", "Open or Close TreeToggle" }
      }
    },
    user_general = {
      i = {
        jk = { "<ESC>", "escape insert mode" }
      },
      n = {
        [";"] = { ":", "enter cmdline" }
      }
    }
  },
  plugins = {
    ["Pocco81/TrueZen.nvim"] = {},
    ["goolord/alpha-nvim"] = {
      cmd = "Alpha",
      disable = false
    },
    ["hrsh7th/nvim-cmp"] = {
      override_options = <function 1>
    },
    ["williamboman/mason.nvim"] = {
      override_options = {
        ensure_installed = { "html-lsp", "clangd" }
      }
    }
  },
  ui = {
    theme = "gruvchad"
  }
}
--]]
