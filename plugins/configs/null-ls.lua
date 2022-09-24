local present, null_ls = pcall(require, "null-ls")

if not present then
  vim.notify("null-ls not found!")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local completion = null_ls.builtins.completion

null_ls.setup({
   
	debug = true,
	sources = {
		-- formatting.autopep8, -- for python
		formatting.stylua,     -- for lua
      formatting.clang_format, -- for cpp
    -- formatting.gofmt,       -- for golang
    -- formatting.shfmt,       -- for shell
      formatting.cmake_format,

    -- diagnostics.flake8,
      diagnostics.clang_check,
      diagnostics.cmake_lint,

      completion.spell,
	},

  -- you can reuse a shared lspconfig on_attach callback here
  -- 下面这个应该是默认打开的，但是被我注释掉了
--   on_attach = function(client)
--       -- NOTE: 如果想要禁止某种语言在save时format，可以添加判定
--       -- if client.name == "xxx" then
--       --
--       -- end
--       -- auto format when save file
--     if client.resolved_capabilities.document_formatting then
--       vim.cmd([[
--             augroup LspFormatting
--             autocmd! * <buffer>
--             autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
--             augroup END
--             ]])
--     end
--   end,
})

