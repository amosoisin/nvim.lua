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
--      require("zenburn").setup()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      require("catppuccin").setup({
          flavour = "macchiato", -- latte, frappe, macchiato, mocha
          background = { -- :h background
              light = "latte",
              dark = "mocha",
          },
          transparent_background = false, -- disables setting the background color.

          float = {
              transparent = false, -- enable transparent floating windows
              solid = false, -- use solid styling for floating windows, see |winborder|
          },
          show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
          term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
          dim_inactive = {

              enabled = false, -- dims the background color of inactive window
              shade = "dark",
              percentage = 0.15, -- percentage of the shade to apply to the inactive window
          },
          no_italic = false, -- Force no italic
          no_bold = false, -- Force no bold
          no_underline = false, -- Force no underline
          styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
              comments = { "italic" }, -- Change the style of comments
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},

              -- miscs = {}, -- Uncomment to turn off hard-coded styles
          },
          lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
              virtual_text = {
                  errors = { "italic" },
                  hints = { "italic" },
                  warnings = { "italic" },
                  information = { "italic" },
                  ok = { "italic" },
              },
              underlines = {
                  errors = { "underline" },
                  hints = { "underline" },

                  warnings = { "underline" },
                  information = { "underline" },
                  ok = { "underline" },
              },
              inlay_hints = {
                  background = true,
              },

          },
          color_overrides = {},
          custom_highlights = {},
          default_integrations = true,
          auto_integrations = false,

          integrations = {

              cmp = true,
              gitsigns = true,
              nvimtree = true,
              notify = false,
              mini = {
                  enabled = true,

                  indentscope_color = "",
              },
              -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
          },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme "catppuccin"
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
  },
  {
    -- ぱんくずリスト用プラグイン
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
}
