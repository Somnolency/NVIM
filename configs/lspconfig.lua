local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  -- 为了解决clangd与null-ls的编码不一致，改变clangd编码
  capabilities.offsetEncoding =  {"utf-16" }
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- 为了解决clangd与null-ls的编码不一致，改变clangd编码
    }
end

-- 
-- lspconfig.pyright.setup { blabla}
