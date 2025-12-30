return {
  {
    "Mofiqul/dracula.nvim",
    config = function()
--      vim.cmd("colorscheme dracula-soft")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
--      vim.cmd("colorscheme duskfox")
    end
  },
  {
    "phha/zenburn.nvim",
    config = function()
      require("zenburn").setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.config.lualine")
    end,
  },
  {
    "miversen33/sunglasses.nvim",
    config = function ()
      require("sunglasses").setup({
        filter_type = "SHADE",
        filter_percent = .30,
      })
    end,
    event = "UIEnter",
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
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("plugins.config.vim-illuminate")
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    'b0o/incline.nvim',
    config = function()
      require('incline').setup()
    end,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    'jinh0/eyeliner.nvim',
    config = function()
      require("plugins.config.eyeliner")
    end
  },
  {
    -- 区切り文字をカラフルにする
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      vim.g.rainbow_delimiters = {
          strategy = {
              [''] = 'rainbow-delimiters.strategy.global',
              vim = 'rainbow-delimiters.strategy.local',
          },
          query = {
              [''] = 'rainbow-delimiters',
              lua = 'rainbow-blocks',
          },
          priority = {
              [''] = 110,
              lua = 210,
          },
          highlight = {
              'RainbowDelimiterRed',
              'RainbowDelimiterYellow',
              'RainbowDelimiterBlue',
              'RainbowDelimiterOrange',
              'RainbowDelimiterGreen',
              'RainbowDelimiterViolet',
              'RainbowDelimiterCyan',
          },
      }
    end
  }
}
