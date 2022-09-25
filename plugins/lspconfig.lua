-- custom.plugins.lspconfig
local present, lspconf = pcall(require, "plugins.configs.lspconfig")

if not present then
  vim.notify("lspconfig not found!")
	return
end

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "cmake", "clangd", }


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

-- 为了解决clangd与null-ls编码问题不一致，改变clangd的编码
capabilities.offsetEncoding = { "utf-16" }

-- clangd配置
lspconfig["clangd"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
          "clangd",
          "--background-index",
          "--suggest-missing-includes",
          "--clang-tidy",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    single_file_support = true,
}

-- -- cmake配置
lspconfig.cmake.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "cmake" },
    init_options = {
        buildDirectory = "build",
    },
    -- single_file_support = true,
}