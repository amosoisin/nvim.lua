-- =========
-- 一般オプション
-- =========
vim.opt.smarttab   = true

vim.opt.hlsearch   = true
vim.opt.wrapscan   = true
vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.incsearch  = true

vim.opt.backup     = false
vim.opt.swapfile   = false
vim.opt.undofile   = true  -- 永続的アンドゥ
vim.opt.autoread   = true
vim.opt.hidden     = true
vim.opt.showcmd    = true

vim.opt.mouse      = ""  -- マウス無効

-- UI設定
vim.opt.signcolumn = "yes"  -- サイン列を常に表示

-- ウィンドウ分割
vim.opt.splitright = true  -- 右に分割
vim.opt.splitbelow = true  -- 下に分割

-- スクロール余白
vim.opt.scrolloff     = 8   -- 上下スクロール余白
vim.opt.sidescrolloff = 8   -- 左右スクロール余白

vim.opt.fileformats   = { "unix", "dos", "mac" }
vim.opt.fileencodings = { "utf-8", "sjis", "euc-jp", "default" }

-- b:match_words = &matchpairs . ',begin:end'
-- Vimscript のバッファ変数 b:match_words に相当
vim.b.match_words = vim.o.matchpairs .. ",begin:end"


-- =========
-- スペルチェック
-- =========
vim.opt.spell = true
vim.opt.spelllang = { "en", "cjk" }
