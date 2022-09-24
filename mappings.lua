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

默认可选项设置
{
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, 
  noremap = true,
  nowait = false,

  -- all standard key binding opts are supported 
}

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

M.Lspsage = {
  n = {
    ["gr"] = {"<cmd>Lspsaga rename<cr>", "Lspsage rename"},
    ["gx"] = {"<cmd>Lspsaga code_action<cr>", "Lspsaga code action"},
    ["K"] = {"<cmd>Lspsaga hover_doc<cr>","Lspsaga hover_doc"},
    ["go"] = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Lspsaga show_line_diagnostics"},
    ["gj"] = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "Lspsaga diagnostic_jump_next"},
    ["gk"] = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "Lspsaga diagnostic_jump_prev"},
    ["<C-u>"] = {"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", "Lspsaga smart scroll up", opts = { silent = false, noremap = false }},
    ["<C-d>"] = {"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", "Lspsaga smart scroll up", opts = { silent = false, noremap = false }},
  },
  
  x = {
    ["gx"] = {":<c-u>Lspsaga range_code_action<cr>", "Lspsaga range code action"}
  }
}

return M
