return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
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

