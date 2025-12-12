-- 行番号表示
vim.opt.number = true

-- カラー設定
vim.opt.termguicolors = true  -- GUIカラー有効

-- 不可視文字の表示
vim.opt.list = true
vim.opt.listchars = {
  tab = '»-',
  trail = '-',
  eol = '↲',
  extends = '»',
  precedes = '«',
  nbsp = '%'
}

-- ステータスラインを常に表示
vim.opt.laststatus = 3
