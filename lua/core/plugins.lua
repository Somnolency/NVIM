local packer = require("packer")
packer.startup(
  {
    -- 所有插件的安装都书写在 function 中
    function()
    -- Packer can manage itself
    -- 可以一次加载一个插件，跟上一个字符串
      use 'wbthomason/packer.nvim'    --包管理器

      -- 可以在插件加载完成后自动运行一些代码
      --use {
      --  'neovim/nvim-lspconfig', -- "插件地址"
      --  config= function() 
      --    require('plugin-config/lsp-config') --"需要运行的代码 ..."
      --  end
      --}
      
      
      -- lspconf
      -- 可以一次加载多个插件，跟上一个 list
      use {
        -- "插件地址"
        'saadparwaiz1/cmp_luasnip',    --Sniippets source for nvim-cmp
        -- 'L3MON4D3/LuaSnip'    --Snippet plugin
      }

      -- 自动代码补全系列插件
      use {
        "hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
        requires = {
            {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
            {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
            {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
            {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
            {"hrsh7th/cmp-path"}, -- 路径补全
            {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
            {"hrsh7th/cmp-cmdline"}, -- 命令补全
            {"f3fora/cmp-spell"}, -- 拼写建议
            {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
            {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
            -- tabnine 源,提供基于 AI 的智能补全
            {'tzachar/cmp-tabnine', run='powershell ./install.ps1'}
        },
        config = function()
            require("lspconf.nvim-cmp")
        end
      }

      
      -- themes (disabled other themes to optimize startup time)
      -- nord theme
      -- use 'shaunsingh/nord.nvim'
      -- use 'sainnhe/sonokai'
      --    use 'joshdick/onedark.vim'
      --  use { 
        --    'catppuccin/nvim', 
        --    -- 改个别名
        --    as='catppuccin' 
        -- }
        --    use { 'sonph/onehalf', rtp='vim/' }
        --    use 'liuchengxu/space-vim-dark'
        --    use 'ahmedabdulrahman/aylin.vim'
        
        -- 优秀的暗色主题
      use {
        "catppuccin/nvim",
        -- 改个别名，因为它的名字是 nvim，可能会冲突
        as = "catppuccin",
        config = function()
            -- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
            require("pluginconf.catppuccin")
        end
      }

      -- nvim-tree
      -- 对于有依赖的插件，可以使用 requires 跟上一个 list
      use { 
        -- "插件地址"
        'kyazdani42/nvim-tree.lua',
        requires = {
          --  "依赖的插件地址"
          'kyazdani42/nvim-web-devicons' -- "依赖一个图标插件"
        },
        config = function ()
          -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
          require("pluginconf.nvim-tree")
        end
      }

      -- LSP 基础服务
      use {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconf.config")
        end
      }
                                              
      -- 自动安装 LSP
      use {
        "williamboman/nvim-lsp-installer",
        config = function()
            require("lspconf.setup")
        end
      }                                          
                                              
      -- LSP UI 美化
      use {
        "tami5/lspsaga.nvim",
        config = function()
            require("lspconf.lspsaga")
        end
      }

      -- LSP 进度提示
      use {
        "j-hui/fidget.nvim",
        config = function()
            require("lspconf.fidget")
        end
      }

      -- 炫酷的状态栏插件
      use {
        "windwp/windline.nvim",
        config = function()
            -- 插件加载完成后自动运行 lua/conf/windline.lua 文件中的代码
            require("pluginconf.windline")
        end
      }

      -- 为了能让状态栏显示 git 信息，所以这个插件是必须的
      use {
        "lewis6991/gitsigns.nvim",
        requires = {
            -- 依赖于该插件（一款 Lua 开发使用的插件）
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("gitsigns").setup()
        end
      }
      -- 支持 LSP 状态的 buffer 栏
      use {
        "akinsho/bufferline.nvim",
        requires = {
            "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
        },
        config = function()
            require("pluginconf.bufferline")
        end
      }

      -- 搜索时显示条目
      use {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("pluginconf.nvim-hlslens")
        end
      }

      -- 显示缩进线
      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("pluginconf.indent-blankline")
        end
      }

      -- 自动匹配括号
      use {
        "windwp/nvim-autopairs",
        config = function()
            require("pluginconf.nvim-autopairs")
        end
      }

      -- 包裹修改
      use {
        "ur4ltz/surround.nvim",
        config = function()
            require("pluginconf.surround")
        end
      }

      -- 显示光标下相同词汇
      use {
        "RRethy/vim-illuminate",
        config = function()
            require("pluginconf.vim-illuminate")
        end
      }

      -- 自动保存(可能与插件实时生效有干扰)
      use {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("pluginconf.autosave")
        end
      }

      -- 自动恢复光标位置
      use {
        "ethanholz/nvim-lastplace",
        config = function()
            require("pluginconf.nvim-lastplace")
        end
      }

      -- 内置终端
      use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("pluginconf.toggleterm")
        end
      }

      -- 模糊查找
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep", -- 文字查找
            "sharkdp/fd" -- 文件查找
        },
        config = function()
            require("pluginconf.telescope")
        end
      }

      -- 精美弹窗
      use {
        "rcarriga/nvim-notify",
        config = function()
            require("pluginconf.nvim-notify")
        end
      }

      -- todo tree
      use {
        "folke/todo-comments.nvim",
        config = function()
            require("pluginconf.todo-comments")
        end
      }

      -- 插入模式获得函数签名
      use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lspconf.lsp_signature")
        end
      }

      -- 灯泡提示代码行为
      use {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("pluginconf.nvim-lightbulb")
        end
      }

      -- 键位绑定器
      use {
        "folke/which-key.nvim",
        config = function()
            require("pluginconf.which-key")
        end
      }

      -- 语法高亮
      use {
        "nvim-treesitter/nvim-treesitter",
        run = {":TSupdate"},
        requires = {
            "p00f/nvim-ts-rainbow" -- 彩虹括号
        },
        config = function()
            require("pluginconf.nvim-treesitter")
        end
      }

      -- 开始屏幕
      use 'p-z-l/aleph-nvim'

      -- 快速跳转
      use {
        "phaazon/hop.nvim",
        config = function()
            require("pluginconf.hop")
        end
      }

      -- view tree 大纲预览
      use {
        "liuchengxu/vista.vim",
        config = function()
            require("pluginconf.vista")
        end
      }
      
      -- 代码调试基础插件
      use {
        "mfussenegger/nvim-dap",
        config = function()
            -- require("pluginconf.nvim-dap")
        end
      }
                                                  
      -- 为代码调试提供内联文本
      use {
        "theHamsta/nvim-dap-virtual-text",
        requires = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("pluginconf.nvim-dap-virtual-text")
        end
      }
                                                  
      -- 为代码调试提供 UI 界面
      use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("pluginconf.nvim-dap-ui")
        end
      }

      --Dap安装插件
      use "ravenxrz/DAPInstall.nvim"

    end,  

    -- 使用浮动窗口
    config = {
      display = {
          open_fn = require("packer.util").float
      }
    }
  }
)

-- 实时生效配置
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)