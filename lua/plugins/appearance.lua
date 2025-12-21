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
      vim.cmd("colorscheme duskfox")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.config.lualine")
    end,
  },
  {
    "levouh/tint.nvim",
    config = function()
      require("tint").setup()
    end,
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
}
