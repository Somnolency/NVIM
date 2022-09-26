-- example file i.e lua/custom/init.lua

-- MAPPINGS
-- local map = require("core.utils").map

-- map("n", "<leader>cc", ":Telescope <CR>")
-- map("n", "<leader>q", ":q <CR>")

-- require("my autocmds file") or just declare them here

-- 开启 Folding 模块
-- zc是折叠，zo是展开折叠
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

