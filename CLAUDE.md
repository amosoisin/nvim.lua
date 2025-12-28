# Neovim設定プロジェクト - Claude Code指示

このプロジェクトはNeovimの設定ファイル群です。最新のNeovimをビルドして使用することを前提としています。

## プロジェクト概要

**目的:** モダンで拡張性の高いNeovim開発環境の構築
**主な用途:**
- 組込みLinux開発（C/Bash）
- 多言語対応（Python、TypeScript、Lua等）
- Neovim設定自体の開発

**方針:** lazy.nvimベースのモジュール化された設定、LSP完全対応、視覚的な改善

---

## プロジェクト構造

```
nvim.lua/
├── init.lua                    # エントリーポイント
├── lazy-lock.json              # プラグインバージョン固定ファイル
│
├── lua/
│   ├── config/                 # コア設定
│   │   ├── lazy.lua           # lazy.nvimブートストラップ
│   │   ├── options.lua        # Neovimオプション
│   │   ├── appearance.lua     # 見た目設定
│   │   ├── keymap.lua         # グローバルキーマップ
│   │   ├── lsp.lua            # LSP基本設定（※要統合）
│   │   └── filetype.lua       # ファイルタイプ設定
│   │
│   └── plugins/                # プラグイン定義
│       ├── depends.lua         # 依存ライブラリ（Treesitter等）
│       ├── global.lua          # 汎用プラグイン
│       ├── lsp.lua             # LSP関連プラグイン
│       ├── appearance.lua      # UI/UX改善プラグイン
│       ├── telescope.lua       # ファジーファインダー
│       ├── git.lua             # Git統合
│       ├── ai.lua              # Claude Code統合
│       ├── markdown.lua        # Markdown対応
│       │
│       └── config/             # プラグイン個別設定
│           ├── mason-lspconfig.lua
│           ├── lualine.lua
│           ├── none-ls.lua
│           ├── noice.lua
│           ├── incline.lua
│           ├── gitsigns.lua
│           └── ...
```

---

## 重要な原則

### 1. モジュール化とメンテナンス性

**ファイル配置のルール:**
- `config/`: Neovim自体の設定（オプション、キーマップ等）
- `plugins/`: プラグインのインストール定義
- `plugins/config/`: プラグインの詳細設定

**変更時の注意:**
- 小規模な変更を段階的に行う
- 変更理由を明確にする
- 関連ファイルへの影響を考慮する

### 2. lazy.nvimの活用

**遅延読み込み戦略:**
```lua
{
  "plugin-name",
  event = "VeryLazy",      -- イベントトリガー
  cmd = "PluginCommand",   -- コマンドトリガー
  keys = { "<leader>x" },  -- キーマップトリガー
  ft = "filetype",         -- ファイルタイプトリガー
}
```

**パフォーマンス重視:**
- 頻繁に使用するプラグイン: `lazy = false`
- 特定条件下のみ使用: `event`, `cmd`, `keys`, `ft`指定

### 3. LSP設定の一元管理

**現在の問題点:**
- `config/lsp.lua`と`plugins/config/mason-lspconfig.lua`でLSP有効化が重複
- 今後は`mason-lspconfig.lua`に統一すること

**LSPサーバー追加手順:**
1. `plugins/config/mason-lspconfig.lua`に`vim.lsp.enable("server_name")`を追加
2. Masonで必要に応じてサーバーをインストール: `:MasonInstall server_name`

### 4. カラースキームとテーマ

**現在の設定:**
- アクティブ: `zenburn`
- コメントアウト: `dracula-soft`, `duskfox`（将来の切り替え用に保持）

**変更方法:**
```lua
-- lua/plugins/appearance.lua
vim.cmd("colorscheme zenburn")  -- この行のコメントを切り替え
```

---

## 既知の問題と対応

### 🔴 緊急度: 高

#### 1. markdown.luaの依存関係重複
**ファイル:** `lua/plugins/markdown.lua:3-6`
**問題:** `dependencies`が3回定義されている
**対応:** mini.iconsのみを残して他を削除（TODO参照）

#### 2. LSP設定の重複
**ファイル:** `config/lsp.lua`, `plugins/config/mason-lspconfig.lua`
**問題:** LSP有効化が二重に実行される可能性
**対応:** `config/lsp.lua`を削除し、`mason-lspconfig.lua`に統合（TODO参照）

#### 3. 非推奨API使用
**ファイル:** `plugins/config/mason-lspconfig.lua:31`
**問題:** `vim.lsp.diagnostic.on_publish_diagnostics`は非推奨
**対応:** `vim.diagnostic.on_publish_diagnostics`に変更（TODO参照）

### 🟡 緊急度: 中

#### 4. 古いPacker.nvim構文
**ファイル:** `lua/plugins/depends.lua:10-11`
**問題:** `after`, `requires`はlazy.nvimでは非推奨
**対応:** `dependencies`に統一（TODO参照）

#### 5. Telescope基本設定の不足
**ファイル:** `lua/plugins/telescope.lua`
**問題:** キーマップや基本設定が未定義
**対応:** 基本キーマップを追加（TODO参照）

---

## 推奨される作業パターン

### プラグイン追加時

```lua
-- 1. lua/plugins/[category].lua に定義を追加
return {
  {
    "author/plugin-name",
    event = "VeryLazy",  -- 遅延読み込み設定
    dependencies = { "dependency/plugin" },
    opts = {},  -- シンプルな設定の場合
    -- または
    config = function()
      require("plugins.config.plugin-name")
    end,
  }
}

-- 2. 詳細設定が必要な場合は lua/plugins/config/plugin-name.lua を作成
```

### LSPサーバー追加時

```bash
# 1. Masonでインストール
:MasonInstall language_server_name

# 2. lua/plugins/config/mason-lspconfig.lua に追加
vim.lsp.enable("language_server_name")

# 3. 動作確認
:LspInfo
```

### キーマップ追加時

**グローバルキーマップ:** `config/keymap.lua`
**プラグイン専用キーマップ:** プラグイン定義の`keys`セクション

```lua
-- プラグイン定義内でキーマップを設定（推奨）
keys = {
  { "<leader>x", "<cmd>PluginCommand<cr>", desc = "説明" },
}
```

---

## 設定変更チェックリスト

新しい変更を加える際は、以下を確認してください：

- [ ] 変更の目的が明確か
- [ ] 影響範囲を把握しているか
- [ ] 既存の設定との競合はないか
- [ ] 遅延読み込みは適切か（パフォーマンス）
- [ ] エラーログを確認したか (`:messages`, `:checkhealth`)
- [ ] lazy-lock.jsonへの影響を確認したか

---

## トラブルシューティング

### プラグインが読み込まれない

```vim
:Lazy sync          " プラグイン同期
:Lazy clean         " 未使用プラグイン削除
:Lazy restore       " lazy-lock.jsonから復元
```

### LSPが動作しない

```vim
:LspInfo            " LSP接続状態確認
:Mason              " LSPサーバーインストール状態確認
:checkhealth lsp    " LSP健全性チェック
```

### Treesitterエラー

```vim
:TSUpdate           " パーサー更新
:TSInstall language " 特定言語パーサーインストール
:checkhealth treesitter
```

### 起動が遅い

```vim
:Lazy profile       " プラグイン読み込み時間プロファイル
```

---

## 参考情報

**公式ドキュメント:**
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim)

**ヘルスチェック:**
```vim
:checkhealth        " 全体
:checkhealth lazy   " lazy.nvim
:checkhealth lsp    " LSP
```

---

**最終更新:** 2025-12-28
