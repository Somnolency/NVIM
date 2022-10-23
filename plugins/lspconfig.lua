-- custom.plugins.lspconfig
local present, _ = pcall(require, "plugins.configs.lspconfig")

if not present then
  vim.notify "lspconfig not found!"
  return
end

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- clangd配置
capabilities.offsetEncoding = { "utf-16" }
lspconfig["clangd"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    -- "--background-index",
    -- "--suggest-missing-includes",
    "--clang-tidy",
    -- 指定clang-tidy的检查参数， 摘抄自cmu15445. 全部参数可参考 https://clang.llvm.org/extra/clang-tidy/checks
    "--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
    "--completion-style=detailed",
    "--cross-file-rename=true",
    "--pch-storage=memory",
    -- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
    "--function-arg-placeholders=false",
    "--log=verbose",
    -- -- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
    "--header-insertion-decorators",
    "--j=6",
    "--pretty",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  single_file_support = false,
}

-- -- cmake配置
lspconfig["cmake"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "cmake" },
  init_options = {
    buildDirectory = "build",
  },
  -- single_file_support = true,
}
