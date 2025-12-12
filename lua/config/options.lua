-- =========
-- タブ関連のユーティリティ関数
-- =========
local function Set2extab()
  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
end

local function Set4extab()
  vim.opt.expandtab = true
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
end

local function Set8noextab()
  vim.opt.expandtab = false

  vim.opt.tabstop = 8
  vim.opt.shiftwidth = 8
end

-- 既定を 4 スペースインデントに
Set4extab()


-- =========
-- ファイルタイプ別インデント
-- =========
local aug_indent = vim.api.nvim_create_augroup("fileTypeIndent", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = aug_indent,
  pattern = "*.c",
  callback = Set8noextab,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = aug_indent,
  pattern = "*.py",
  callback = Set4extab,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = aug_indent,
  pattern = "*.html",
  callback = Set2extab,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = aug_indent,
  pattern = "*.js",
  callback = Set2extab,
})


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
vim.opt.autoread   = true
vim.opt.hidden     = true
vim.opt.showcmd    = true

vim.opt.mouse      = ""  -- マウス無効

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
