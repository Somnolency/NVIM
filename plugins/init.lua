return {
    -- LSP UI 美化
--    ["tami5/lspsaga.nvim"] = {
--     config = function()
--         require("custom.plugins.configs.lspsaga")
--     end
--     },

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

    -- 键位绑定器
    ["folke/which-key.nvim"] = {
        config = function()
            require("custom.plugins.configs.which-key")
        end
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

    -- 搜索时显示条目
    -- ["kevinhwang91/nvim-hlslens"] = {
    --     config = function()
    --         require("custom.plugins.configs.nvim-hlslens")
    --     end
    -- },

    -- 自动保存(可能与插件实时生效有干扰)
    ["Pocco81/AutoSave.nvim"] = {
        config = function()
            require("custom.plugins.configs.autosave")
        end
    },

    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
           require("custom.plugins.configs.null-ls").setup()
        end,
   },
}