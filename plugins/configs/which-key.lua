-- https://github.com/folke/which-key.nvim

require("which-key").setup(
    {
        plugins = {
            spelling = {
                -- 是否接管默认 z= 的行为
                enabled = true,
                suggestions = 20
            }
        },
        layout = {
            height = { min = 4, max = 8 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 15, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            -- margin是指从自身边框到另一个容器边框之间的距离，就是容器外距离。
            margin = { 0, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            -- padding是指自身边框到自身内部另一个容器边框之间的距离，就是容器内距离。
            padding = { 0, 1, 0, 1 }, -- extra window padding [top, right, bottom, left]
            winblend = 0
        },

    }
)