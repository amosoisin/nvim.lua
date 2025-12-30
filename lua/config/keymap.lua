-- キーマッピング設定（Neovim推奨: vim.keymap.set）
local opts = { noremap = true, silent = true }

-- コロンとセミコロンを入れ替え
vim.keymap.set('n', ':', ';', opts)
vim.keymap.set('n', ';', ':', opts)

-- ハイライト解除（Escを2回）
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- バッファ移動（Ctrl+h / Ctrl+l）
vim.keymap.set('n', '<C-h>', ':bprev<CR>', opts)
vim.keymap.set('n', '<C-l>', ':bnext<CR>', opts)
