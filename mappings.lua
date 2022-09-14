local M = {}

-- add this table only when you want to disable default keys
--[[
You have to put your mappings into like n, v, i, t etcmodes
["keys"] = {"action", "icon  mapping description", opts = {}}

M.abc = {

  n = { n是指在normal模式下
     ["<C-n>"] = {"<cmd> Telescope <CR>", "Open Telescope"}
  }

  i = {
    -- more keys!
  }
}
abc以上是任意的;例如，它们可能是插件的名称xyz
请务必维护类似于核心映射的表结构
映射将自动加载。您无需手动加载它们
]]--
--[[
M.disabled = {
    n = {
        ["<leader>h"] = ""
        ["<C-s>"] = ""
    }
}
]]--

M.user_general = {
  n = {
    [";"] = { ":", "enter cmdline", opts = { nowait = true } },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  }
}

M.NvimTreeToggle = {
    n = {
        ["<leader>m"] = {"<cmd>NvimTreeToggle<CR>", "Open or Close TreeToggle"}
    }
}
return M
