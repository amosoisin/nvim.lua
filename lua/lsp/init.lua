-- ビルトインLSP設定の読み込みエントリーポイント
-- Phase 1
require("lsp.bashls")

-- Phase 2: 段階的移行
require("lsp.pyright")
require("lsp.ts_ls")
require("lsp.clangd")

-- Phase 2: 残り（インストール要）
require("lsp.lua_ls")
require("lsp.rust")
require("lsp.docker")
