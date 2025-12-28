# Neovim設定プロジェクト - Claude Code指示

このプロジェクトはNeovimの設定ファイル群です。最新のNeovimをビルドして使用することを前提としています。

## プロジェクト概要

**目的:** モダンで拡張性の高いNeovim開発環境の構築
**主な用途:**
- 組込みLinux開発（C/Bash）
- 多言語対応（Python、TypeScript、Lua等）
- Neovim設定自体の開発

**方針:** lazy.nvimベースのモジュール化された設定、LSP完全対応、視覚的な改善

**📖 ユーザー向けドキュメント:** 詳細なセットアップ方法やキーマップについては、[README.md](README.md)を参照してください。

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
│   │   ├── filetype.lua       # ファイルタイプ設定
│   │   └── lsp.lua            # LSP共通設定（診断、ハンドラー、キーマップ）
│   │
│   ├── lsp/                    # ビルトインLSP設定（Neovim 0.11+）
│   │   ├── init.lua           # LSP設定読み込みエントリーポイント
│   │   ├── bashls.lua         # Bash
│   │   ├── pyright.lua        # Python
│   │   ├── ts_ls.lua          # TypeScript/JavaScript
│   │   ├── clangd.lua         # C/C++
│   │   ├── lua_ls.lua         # Lua
│   │   ├── rust.lua           # Rust
│   │   └── docker.lua         # Docker
│   │
│   └── plugins/                # プラグイン定義
│       ├── depends.lua         # 依存ライブラリ（Treesitter等）
│       ├── global.lua          # 汎用プラグイン
│       ├── lsp.lua             # LSP拡張プラグイン
│       ├── appearance.lua      # UI/UX改善プラグイン
│       ├── telescope.lua       # ファジーファインダー
│       ├── git.lua             # Git統合
│       ├── ai.lua              # Claude Code統合
│       ├── markdown.lua        # Markdown対応
│       │
│       └── config/             # プラグイン個別設定
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

### 3. LSP設定の管理（Neovim 0.11+ ビルトインLSP使用）

**設定ディレクトリ:** `lua/lsp/`、共通設定: `lua/config/lsp.lua`

Neovim 0.11+のビルトインLSP機能（`vim.lsp.config()`, `vim.lsp.enable()`）を使用し、mason.nvim等のプラグインに依存しない構成です。

**現在有効なLSPサーバー:**
- `bashls` (Bash)
- `pyright` (Python)
- `ts_ls` (TypeScript/JavaScript)
- `clangd` (C/C++)
- `lua_ls` (Lua) - 要インストール
- `rust_analyzer` (Rust) - 要インストール
- `dockerls` (Docker) - 要インストール

**LSPサーバー追加手順:**
1. LSPサーバーをシステムにインストール（npm、cargo、apt等）
   ```bash
   # 例: Bash Language Server
   npm install -g bash-language-server
   ```
2. `lua/lsp/[server].lua`を作成:
   ```lua
   vim.lsp.config("server_name", {
     cmd = { "server-command", "--stdio" },
     filetypes = { "filetype" },
     root_markers = { ".git" },
     settings = {},
   })
   vim.lsp.enable("server_name")
   ```
3. `lua/lsp/init.lua`に追加: `require("lsp.server_name")`
4. Neovim再起動で有効化

**利用可能なLSPキーマップ:**
- 基本ナビゲーション: `K`, `gd`, `gD`, `gi`, `gt`, `gr`
- アクション: `gn`, `ga`, `gf`
- 診断: `ge`, `g]`, `g[`
- シンボル検索: `<leader>ds`, `<leader>ws`
- 機能切り替え: `<leader>th`, `<leader>cl`
- 署名ヘルプ: `<C-k>` (インサートモード)

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

## 最近の改善（2025-12-28）

### ✅ LSPキーマップの拡張完了

**ファイル:** `lua/plugins/config/mason-lspconfig.lua`

以下の機能を追加しました：
- バッファ固定キーマップ（各LSPバッファ専用）
- すべてのキーマップに説明を追加（which-key対応）
- Telescope統合（`<leader>ds`: ドキュメントシンボル、`<leader>ws`: ワークスペースシンボル）
- インレイヒント切り替え（`<leader>th`）
- コードレンズ実行と自動更新（`<leader>cl`）
- 署名ヘルプ（`<C-k>` インサートモード）
- 非同期フォーマット実行

### ✅ ドキュメント整備完了

**作成ファイル:** `README.md`

包括的なドキュメントを作成：
- プロジェクト概要とインストール手順
- ファイル構造の詳細説明
- 主要キーマップ一覧（グローバル、LSP、Telescope、Git）
- プラグイン管理とLSP設定の手順
- トラブルシューティングガイド
- カスタマイズ方法

### ⚠️ lazy-lock.json管理の推奨

**現状:** `.gitignore`に含まれており、git管理されていない

**推奨:** git管理に含めることで以下のメリットがあります：
- プラグインバージョンの再現性保証
- チーム開発時のバージョン統一
- 問題発生時のロールバック容易化

**対応方法:**
```bash
# .gitignoreからlazy-lock.jsonを削除
# lazy-lock.jsonをgit管理に追加
git add lazy-lock.json
```

---

## 既知の問題と対応

### 現在、緊急対応が必要な問題はありません

優先度高・中の問題は対応済みです。詳細はTODO.mdを参照してください。

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
# 1. LSPサーバーをインストール（npmの例）
npm install -g language-server-name

# 2. lua/lsp/[server].luaを作成
# vim.lsp.config()とvim.lsp.enable()を記述

# 3. lua/lsp/init.luaに追加
require("lsp.server_name")

# 4. Neovim再起動して動作確認
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
which server-name   " コマンドが存在するか確認（bash）
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
- [Neovim LSP](https://neovim.io/doc/user/lsp.html) - ビルトインLSP機能

**ヘルスチェック:**
```vim
:checkhealth        " 全体
:checkhealth lazy   " lazy.nvim
:checkhealth lsp    " LSP
```

---

## 最近の改善（2025-12-29）

### ✅ ビルトインLSPへの移行完了

mason.nvim、mason-lspconfig.nvim、nvim-lspconfigプラグインを削除し、Neovim 0.11+のビルトインLSP機能に完全移行しました。

**変更内容:**
- **削除**: mason関連プラグイン（4プラグイン: mason.nvim, mason-lspconfig.nvim, nvim-lspconfig, mason-null-ls.nvim）
- **新規**: `lua/lsp/`ディレクトリによる設定管理
- **新規**: `lua/config/lsp.lua`による共通設定
- **効果**: プラグイン依存減少、起動時間改善、保守性向上

**移行フェーズ:**
1. **Phase 1: 準備・環境確認** ✅
   - LSP共通設定ファイル作成（`lua/config/lsp.lua`）
   - ビルトインLSP設定構造構築（`lua/lsp/init.lua`, `lua/lsp/bashls.lua`）
   - bashlsで動作テスト

2. **Phase 2: サーバー移行** ✅
   - 以下のLSPサーバー設定ファイルを作成・有効化:
     - `lua/lsp/bashls.lua` (Bash)
     - `lua/lsp/pyright.lua` (Python)
     - `lua/lsp/ts_ls.lua` (TypeScript/JavaScript)
     - `lua/lsp/clangd.lua` (C/C++)
   - 以下は設定ファイル作成済み（必要に応じて有効化可能）:
     - `lua/lsp/lua_ls.lua` (Lua)
     - `lua/lsp/rust.lua` (Rust)
     - `lua/lsp/docker.lua` (Docker)

3. **Phase 3: プラグイン削除** ✅
   - `lua/plugins/lsp.lua`書き換え（mason系削除、LSP拡張プラグインのみ保持）
   - `lua/plugins/config/mason-lspconfig.lua`削除
   - `init.lua`に`require("config.lsp")`追加

4. **Phase 4: ドキュメント更新** ✅
   - CLAUDE.md更新（ファイル構造、LSP管理方法）

### ✅ LSPハンドラー設定エラー修正

移行直後に発生した`attempt to call upvalue 'handler' (a nil value)`エラーを修正しました。

**エラー原因:**
- `lua/config/lsp.lua`で設定していたLSPハンドラーが不適切
- 特に`vim.diagnostic.on_publish_diagnostics`という関数は存在せず、これがnilになっていた
- `vim.lsp.handlers["textDocument/hover"]`等の上書きも不要

**修正内容:**
- `lua/config/lsp.lua`から以下のハンドラー設定を削除:
  ```lua
  vim.lsp.handlers["textDocument/publishDiagnostics"] = ...
  vim.lsp.handlers["textDocument/hover"] = ...
  vim.lsp.handlers["textDocument/signatureHelp"] = ...
  ```
- Neovim 0.11+では、診断設定は`vim.diagnostic.config()`のみで十分
- ハンドラーの直接上書きは不要（デフォルト動作が適切）

**維持される機能:**
- 診断の仮想テキスト無効化、ボーダー表示（`vim.diagnostic.config()`で設定）
- すべてのLSPキーマップ（K, gd, ge, gn, ga等）
- Telescope統合、インレイヒント、コードレンズ

**最終状態:**
- 有効LSPサーバー: bashls, pyright, ts_ls, clangd（全て動作確認済み）
- すべての既存LSP機能を維持しながら、プラグイン依存を削減した安定構成

---

**最終更新:** 2025-12-29
