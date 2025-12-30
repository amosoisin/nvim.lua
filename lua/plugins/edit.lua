return {
  {
    -- 括弧等のペアを自動入力
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  {
    -- タグやクォーテーションを追加、編集
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("plugins.config.nvim-surround")
    end,
  },
  {
    -- コメント化
    -- 範囲選択 + gcc
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },
  {
    -- <C-l>で括弧から出る
    "ysmb-wtsg/in-and-out.nvim",
    keys = {
      {
        "<C-l>",
        function()
          require("in-and-out").in_and_out()
        end,
        mode = "i"
      },
    },
    opts = { additional_targets = { "“", "”" } },
  },
  {
    -- 関数コメントを自動入力
    -- 関数上で<leader>dを入力して自動入力
    -- <Tab>で移動
    'kkoomen/vim-doge',
  },
}
