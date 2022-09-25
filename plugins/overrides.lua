local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "cpp",
    "cmake",
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
    format = function(entry, vim_item)
      local prsnt, lspkind = pcall(require, "lspkind")
        if not prsnt then
          -- Kind icons
          local icons = require("nvchad_ui.icons").lspkind
          -- This concatonates the icons with the name of the item kind
          vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
          -- Source
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[LaTeX]",
          })[entry.source.name]
          return vim_item
        else
          return lspkind.cmp_format()
        end
    end,
  },
}

return M