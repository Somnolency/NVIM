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

]]
--
--[[
M.disabled = {
    n = {
        ["<leader>h"] = ""
        ["<C-s>"] = ""
    }
}
]]
--

M.user_general = {
  n = {
    [";"] = { ":", "enter cmdline", opts = { nowait = true } },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

M.NvimTreeToggle = {
  n = {
    ["<leader>m"] = { "<cmd>NvimTreeToggle<CR>", "Open or Close TreeToggle" },
  },
}

M.Lspsage = {
  n = {
    ['gh'] = {"<cmd>Lspsaga lsp_finder<CR>", "lsp finder"},
    ['gd'] = {"<cmd>Lspsaga peek_definition<cr>", "lsp definition"},
    ["gr"] = { "<cmd>Lspsaga rename<cr>", "Lspsage rename" },
    ["gx"] = { "<cmd>Lspsaga code_action<cr>", "Lspsaga code action" },
    ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Lspsaga hover_doc" },
    ["go"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Lspsaga show_line_diagnostics" },
    ["gp"] = {"<cmd>Lspsaga show_cursor_diagnostics<cr>", "lspsaga show cursor diagnostics"},
    ["gj"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Lspsaga diagnostic_jump_next" },
    ["gk"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Lspsaga diagnostic_jump_prev" },
    ["<C-u>"] = {
      "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>",
      "Lspsaga smart scroll up",
      opts = { silent = false, noremap = false },
    },
    ["<C-d>"] = {
      "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>",
      "Lspsaga smart scroll up",
      opts = { silent = false, noremap = false },
    },
    ['[e'] = {"function() lua require('lspsaga.diagnostic').goto_prev({severity = vim.diagnostic.severity.ERROR}) end", "go to prev error" },
    [']e'] = {"function() lua require('lspsaga.diagnostic').goto_prev({severity = vim.diagnostic.severity.ERROR}) end", "go to prev error" },

  },

  x = {
    ["gx"] = { ":<c-u>Lspsaga range_code_action<cr>", "Lspsaga range code action" },
  },
}

M.Dap = {
  n = {
    ["<leader>db"] = {
      "<cmd>lua require'dap'.toggle_breakpoint(); require'custom.plugins.dap.dap-util'.store_breakpoints(true)<cr>",
      "打断点",
    },
    ["<leader>dB"] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "特殊断点" },
    ["<F9>"] = { "<cmd>lua require'dap'.run_last()<cr>", "上一步" },
    ["<F10>"] = { '<cmd>lua require"custom.plugins.dap.dap-util".reload_continue()<CR>', "重新运行" },
    ["<F4>"] = { "<cmd>lua require'dap'.terminate()<cr>", "dap terminate" },
    ["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>", "dap continue" },
    ["<F6>"] = { "<cmd>lua require'dap'.step_over()<cr>", "步入" },
    ["<F7>"] = { "<cmd>lua require'dap'.step_into()<cr>", "dap step into" },
    ["<F8>"] = { "<cmd>lua require'dap'.step_out()<cr>", "步出" },
    ["K"] = { "<cmd>lua require'dapui'.eval()<cr>", "dapui eval" },
  },
}

return M
