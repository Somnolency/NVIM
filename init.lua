-------------------------------------------------------------------------
--=============================全局变量设置=============================--
-------------------------------------------------------------------------
-- 开启 Folding 模块
-- zc是折叠，zo是展开折叠
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

require "custom.plugins.dap.dap-util"