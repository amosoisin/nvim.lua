return {
  {
    "nvim-telescope/telescope.nvim",
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
    },
    config = function()
      vim.keymap.set({'n', 'v'}, "<leader>tg", require("telescope.builtin").grep_string)
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = "make",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "smartpde/telescope-recent-files",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
}

