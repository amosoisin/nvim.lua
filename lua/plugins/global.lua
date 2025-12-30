return {
  {
    -- 行移動
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end,
  },
  {
    -- キーマップのヒントを表示
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
    -- スクロールバーを表示
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
    -- ファイラ
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
      "s1n7ax/nvim-window-picker",
      "antosha417/nvim-lsp-file-operations",
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
      -- options go here
    }
  },
  {
    -- トラブル情報を表示
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    -- HopAnywhereで移動
    'smoka7/hop.nvim',
    version = "*",
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    }
  },
  {
    -- 言語ごとにタブ設定
    "FotiadisM/tabset.nvim",
    config = function()
      require("plugins.config.tabset")
    end,
  },
  {
    -- コードの塊の先頭を画面上部に表示
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufNewFile", "BufReadPre" },
    config = function()
      require("plugins.config.nvim-treesitter-context")
    end,
  },
  {
    -- 編集履歴を表示して、Undoできる
    "XXiaoA/atone.nvim",
    cmd = "Atone",
    opts = {}, -- your configuration here
  },
  {
    -- jとkを押し続けた時に加速
    'rainbowhxch/accelerated-jk.nvim',
    config = function ()
      require('accelerated-jk').setup({
          mode = 'time_driven',
          enable_deceleration = false,
          acceleration_motions = {},
          acceleration_limit = 150,
          acceleration_table = { 7,12,17,21,24,26,28,30 },
          -- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
          deceleration_table = { {150, 9999} }
      })
    end
  },
  {
    -- 検索、置換用UI
    -- :GrubFarWithinで検索、置換用UIを表示
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()

      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup({

        -- options, see Configuration section below
        -- there are no required options atm
      });
    end
  },
  {
    -- コード内のシンボルを検索、ジャンプ
    "bassamsdata/namu.nvim",
    opts = {
      global = { },
      namu_symbols = { -- Specific Module options
        options = {},
      },
    },
    keys = {
      {
        "<leader>ss",
        ":Namu symbols<cr>",
        desc = "Jump to LSP symbols",
      },
      {
        "<leader>sw",
        ":Namu workspace<cr>",
        desc = "LSP Symbols - Workspace",
      },
    }
  },
}
