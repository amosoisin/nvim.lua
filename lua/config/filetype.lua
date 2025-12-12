-- ファイルタイプ設定の自動コマンド
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.htm",

  command = "setfiletype html",
})
