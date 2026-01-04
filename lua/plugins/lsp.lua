---@type LazyPluginSpec
return {
  -- LSP設定はlua/lsp/配下で管理

  -- LSP補完プラグイン
  {
    "echasnovski/mini.completion",
    version = false,
    config = function()
      require('mini.completion').setup({})
    end,
  },

  -- LSPシンボル一覧表示
  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },

  -- LSP署名ヘルプ
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded"
      }
    },
  },

  -- フォーマッタ・リンタ統合（none-ls）
  {
    "nvimtools/none-ls.nvim",
    event = { "BufNewFile", "BufReadPre" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.config.none-ls")
    end,
  },

  -- VirtualTextをinline表示
  {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy",
      priority = 1000,
      opts = {},
      config = function()
        require("tiny-inline-diagnostic").setup({
          options = {
            multilines = {
              enabled = true,
            },
            show_source = {
              enabled = true,
            }
          },
        })
      end,
  },
}
