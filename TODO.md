# Neovim設定 TODO リスト

このファイルは、Neovim設定の改善・修正項目を管理します。

---

## 🔴 緊急度: 高（即座に対応すべき）

### 1. markdown.luaの依存関係重複を修正

**ファイル:** `lua/plugins/markdown.lua:3-6`
**問題:** `dependencies`が3回定義されている

**修正後:**
```lua
dependencies = {
  'nvim-treesitter/nvim-treesitter',
  'nvim-mini/mini.icons',
},
```

**優先度:** 高 | **作業時間:** 5分

---

## 🟡 緊急度: 中（近いうちに対応すべき）

### 2. 古いPacker.nvim構文の更新

**ファイル:** `lua/plugins/depends.lua:10-11`
**修正:** `after`, `requires` → `dependencies`に統一

**優先度:** 中 | **作業時間:** 5分

---

### 3. Telescope基本設定とキーマップの追加

**ファイル:** `lua/plugins/telescope.lua`
**内容:** 基本的なキーマップ（<leader>ff, <leader>fg等）を追加

**優先度:** 中 | **作業時間:** 15分

---

### 4. グローバルオプションの追加

**ファイル:** `lua/config/options.lua`
**追加項目:**
- undofile（永続的アンドゥ）
- signcolumn="yes"（サイン列固定）
- splitright/splitbelow（分割方向）
- scrolloff/sidescrolloff（スクロール余白）

**優先度:** 中 | **作業時間:** 10分

---

## 🔵 緊急度: 低（余裕があれば対応）

現在、該当するタスクはありません。

---

## ✅ 完了済みタスク

### ビルトインLSPへの移行完了（2025-12-29）

**実施内容:**
- mason.nvim、mason-lspconfig.nvim、nvim-lspconfigプラグインを削除
- `lua/lsp/`ディレクトリによる設定管理に移行
- `lua/config/lsp.lua`による共通設定を追加
- Neovim 0.11+のビルトインLSP機能（`vim.lsp.config()`, `vim.lsp.enable()`）を使用
- ドット記法への統一（`vim.lsp.config.server_name = {...}`）
- 型アノテーション追加（`---@type vim.lsp.Config`）

**効果:**
- プラグイン依存減少、起動時間改善、保守性向上

---

### LSPキーマップの拡張（2025-12-28）

**ファイル:** `lua/config/lsp.lua`
**実施内容:**
- バッファ固定キーマップ設定（`buffer = bufnr`）
- キーマップ説明追加（`desc`パラメータ）
- Telescope統合（`<leader>ds`, `<leader>ws`）
- インレイヒント切り替え（`<leader>th`）
- コードレンズ実行と自動更新（`<leader>cl`）
- 署名ヘルプ（`<C-k>`）
- フォーマット改善（非同期実行）

---

### lazy-lock.jsonの管理確認（2025-12-28）

**確認内容:**
- lazy-lock.jsonは存在し、56個のプラグインバージョンを固定
- 現在`.gitignore`に含まれており、git管理されていない
- 推奨: git管理に含めることでバージョンの再現性を確保

**備考:** ユーザー判断に委ねる

---

### README.mdの作成（2025-12-28）

**ファイル:** `README.md`
**作成内容:**
- プロジェクト概要と特徴
- インストール手順
- ファイル構造の説明
- 主要なキーマップ一覧（グローバル、LSP、Telescope、Git）
- プラグイン管理方法
- LSP設定とサーバー追加手順
- トラブルシューティング
- カスタマイズ方法

---

## 📝 将来的な検討事項

- デバッグ環境（nvim-dap）
- テスト環境（neotest.nvim）
- プロジェクト管理強化
- 組込み開発特化設定

---

**最終更新:** 2025-12-29
