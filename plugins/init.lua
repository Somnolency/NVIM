local M = {}
local overrides = require "custom.plugins.overrides"
M = {
    -- LSP UI 美化
   ["tami5/lspsaga.nvim"] = {
    config = function()
        require("custom.plugins.configs.lspsaga")
    end
    },

    -- 炫酷的状态栏插件
    -- ["windwp/windline.nvim"] = {
    -- config = function()
    --     -- 插件加载完成后自动运行 lua/conf/windline.lua 文件中的代码
    --     require("custom.plugins.configs.windline")
    -- end
    -- },

    -- view tree 大纲预览
    -- ["liuchengxu/vista.vim"] = {
    --     config = function()
    --         require("custom.plugins.configs.vista")
    --     end
    -- },

    -- 键位绑定器 默认安装了
    ["folke/which-key.nvim"] = {
        -- config = function()
        --     require("custom.plugins.configs.which-key")
        -- end
        disable = false,
    },

    -- -- 精美弹窗
    -- ["rcarriga/nvim-notify"] = {
    --     config = function()
    --         require("custom.plugins.configs.nvim-notify")
    --     end
    -- },

    -- 包裹修改
    -- ["ur4ltz/surround.nvim"] = {
    --     config = function()
    --         require("custom.plugins.configs.surround")
    --     end
    -- },

    -- Cmake集成到Neovim
    ["nvim-lua/plenary.nvim"] = {},
    ["Shatur/neovim-tasks"] = {
        after = "nvim-lspconfig",
        config = function()
            require("custom.plugins.configs.neovim-tasks")
        end,
    },

    -- Lsp 相关设置
    ["neovim/nvim-lspconfig"] = {
        config = function()
          require "plugins.configs.lspconfig"
          require "custom.plugins.lspconfig"
        end,
    },

    -- 提供代码高亮, 缩进以及选择
    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = overrides.treesitter,
    },

    -- 搜索时显示条目
    ["kevinhwang91/nvim-hlslens"] = {
        config = function()
            require("custom.plugins.configs.nvim-hlslens")
        end
    },

    -- 自动保存(可能与插件实时生效有干扰)
--     ["Pocco81/AutoSave.nvim"] = {
--         config = function()
--             require("custom.plugins.configs.autosave")
--         end
--     },
    -- 插入lsp等提示信息
    ["jose-elias-alvarez/null-ls.nvim"] = {
        -- after = "nvim-lspconfig",
        config = function()
           require("custom.plugins.configs.null-ls")
        end,
   },
    -- Install plugin
    ["Pocco81/TrueZen.nvim"] = {},

    -- Override plugin definition options
    ["goolord/alpha-nvim"] = {
        disable = false,
    },

    -- Override plugin config
    ["williamboman/mason.nvim"] = {
        override_options = overrides.mason
    },
    
    -- Override plugin config if it has a module called
    -- If you wish to call a module, which is 'cmp' in this case
    -- 代码补全
    ["hrsh7th/cmp-cmdline"] = { after = "cmp-path" },
    ["onsails/lspkind.nvim"] = {},
    ["hrsh7th/nvim-cmp"] = {
        override_options = function()
            local cmp = require "cmp"
            return {
                mapping = {
                ["<C-d>"] = cmp.mapping.scroll_docs(-8),
                },
                formatting = overrides.cmp.formatting,
                window = {
                    completion = {
                      col_offset = -3,
                      side_padding = 0,
                    },
                },

                cmp.setup.filetype('gitcommit', {
                    sources = cmp.config.sources({
                      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
                    }, {
                      { name = 'buffer' },
                    })
                  }),

                -- 命令模式下输入 ':' 启用补全
                cmp.setup.cmdline(':', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                      { name = 'path' }
                    }, {
                      { name = 'cmdline' }
                    })
                }),

                -- 命令模式下输入 '/' 启用补全
                cmp.setup.cmdline('/', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = 'buffer' }
                    }
                }),

                -- 命令模式下输入 '?' 启用补全
                cmp.setup.cmdline('?', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = 'buffer' }
                    }
                }),

                -- cmp 自动补全的排序
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order
                    }
                },
            }
        end,
    },
}


return M