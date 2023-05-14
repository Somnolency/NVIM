---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = {":q!<cr>", "强制退出", opts = {nowait = true}},
    ["<leader>w"] = {":w<cr>", "保存",opts = {nowait = true}},
    ["<leader>wq"] = {":wq<cr>", "保存并退出", opts = {nowait = true}},
    ["dd"] = {'"_dd', "将删除内容存到寄存器_", opts = {nowait = true}},
  },
  v = {
    ["d"] = {'"_d', "将删除内容存到寄存器_", opts = {nowait = true}},
  },
}

-- more keybinds!

return M
