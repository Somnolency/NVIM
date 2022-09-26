local M = {}

M.treesitter = {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "cpp",
    "cmake",
  },
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  },
}


M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- c/c++ stuff
    "clang-format",
    "clangd",
    "cmake-language-server",
    "cmakelang",
    "cpplint",

  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- nvim-cmp 补全设置
M.cmp = {
  formatting = {
    format = require('lspkind').cmp_format({
      with_text = true,
      maxwidth = 50,
      -- mode = "symbol_text",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      }),
      before = function(entry, vim_item)
        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
        return vim_item
      end,
    }),
  }

}

return M