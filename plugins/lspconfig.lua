-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "clangd"}

--[[
这个应该是默认配置,这里添加相应的语言服务器配置
可参考core/plugins/configs/lspconfig.lua 中关于sumneko_lua的配置
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
--]]

-- clangd配置
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    }
}
