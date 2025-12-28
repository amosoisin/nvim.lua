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

### 2. LSP設定の重複を解消

**ファイル:** `config/lsp.lua` と `plugins/config/mason-lspconfig.lua`
**問題:** LSP有効化が2箇所で重複

**対応:**
1. `config/lsp.lua`を削除
2. `init.lua`から`require("config.lsp")`を削除

**優先度:** 高 | **作業時間:** 10分

---

### 3. 非推奨API使用の修正

**ファイル:** `plugins/config/mason-lspconfig.lua:31`
**修正:** `vim.lsp.diagnostic.on_publish_diagnostics` → `vim.diagnostic.on_publish_diagnostics`

**優先度:** 高 | **作業時間:** 3分

---

## 🟡 緊急度: 中（近いうちに対応すべき）

### 4. 古いPacker.nvim構文の更新

**ファイル:** `lua/plugins/depends.lua:10-11`
**修正:** `after`, `requires` → `dependencies`に統一

**優先度:** 中 | **作業時間:** 5分

---

### 5. Telescope基本設定とキーマップの追加

**ファイル:** `lua/plugins/telescope.lua`
**内容:** 基本的なキーマップ（<leader>ff, <leader>fg等）を追加

**優先度:** 中 | **作業時間:** 15分

---

### 6. グローバルオプションの追加

**ファイル:** `lua/config/options.lua`
**追加項目:**
- undofile（永続的アンドゥ）
- signcolumn="yes"（サイン列固定）
- splitright/splitbelow（分割方向）
- scrolloff/sidescrolloff（スクロール余白）

**優先度:** 中 | **作業時間:** 10分

---

## 🔵 緊急度: 低（余裕があれば対応）

### 7. LSPキーマップの拡張
### 8. lazy-lock.jsonの管理確認
### 9. README.mdの作成

---

## 📝 将来的な検討事項

- デバッグ環境（nvim-dap）
- テスト環境（neotest.nvim）
- プロジェクト管理強化
- 組込み開発特化設定

---

**最終更新:** 2025-12-28
