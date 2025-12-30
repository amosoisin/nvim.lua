return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.config.gitsigns")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    -- Gitコンフリクトを視覚的に表示
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function ()
      require'git-conflict'.setup {
        default_mappings = {
          ours = 'o',
          theirs = 't',
          none = '0',
          both = 'b',
          next = 'n',
          prev = 'p',
        },
      }
    end,
  }
}

