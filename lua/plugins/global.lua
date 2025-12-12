return {
    {
        "Mofiqul/dracula.nvim",
        config = function()
            vim.cmd("colorscheme dracula-soft")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        'nacro90/numb.nvim',
        config = function()
          require('numb').setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("plugins.config.nvim-surround")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                  require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        'prochri/telescope-all-recent.nvim',
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "kkharji/sqlite.lua",
            -- optional, if using telescope for vim.ui.select
            "stevearc/dressing.nvim"
        },
        opts = {
            -- your config goes here
        }
    },
    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            'kevinhwang91/nvim-hlslens',
            'lewis6991/gitsigns.nvim',
        },
        config = function()
            require("scrollbar").setup()
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --     `nvim-notify` is only needed, if you want to use the notification view.
            --     If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("plugins.config.noice")
        end,
    }
}
