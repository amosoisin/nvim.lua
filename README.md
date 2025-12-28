# Neovim設定

モダンで拡張性の高いNeovim開発環境設定です。lazy.nvimベースのモジュール化された構成で、LSP完全対応、視覚的改善、多言語サポートを提供します。

## 特徴

- **モダンなプラグイン管理**: lazy.nvimによる高速な起動と遅延読み込み
- **完全なLSP対応**: Neovim 0.11+ビルトインLSP機能による軽量で高速なLSP環境
- **多言語サポート**: Python, C/C++, Bash, Lua, TypeScript, Docker等
- **視覚的改善**: Treesitter構文ハイライト、カスタムステータスライン、アイコン対応
- **Git統合**: Gitsigns, Lazygitによる快適なGitワークフロー
- **Claude Code統合**: AI支援コーディング
- **モジュール構成**: 保守性の高い設定ファイル構造

## 前提条件

- **Neovim**: 0.10.0以降（最新版を推奨）
- **Git**: プラグイン管理に必要
- **Node.js**: 一部のLSPサーバーに必要
- **gcc/make**: Treesitterパーサーのビルドに必要
- **Nerd Font**: アイコン表示に必要（推奨: Hack Nerd Font, JetBrains Mono Nerd Font）

## インストール

```bash
# 1. 既存の設定をバックアップ（存在する場合）
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# 2. この設定をクローン
git clone <repository-url> ~/.config/nvim

# 3. Neovimを起動（初回は自動でプラグインがインストールされます）
nvim

# 4. LSPサーバーをインストール（必要に応じて）
# Neovim内で :Mason を実行してインストール
```

## ファイル構造

```
nvim.lua/
├── init.lua                    # エントリーポイント
├── lazy-lock.json              # プラグインバージョン固定
├── README.md                   # このファイル
├── CLAUDE.md                   # 開発者向けガイド
├── CHEATSHEET.md               # キーマップチートシート
├── TODO.md                     # タスク管理
│
├── lua/
│   ├── config/                 # コア設定
│   │   ├── lazy.lua           # lazy.nvimブートストラップ
│   │   ├── options.lua        # Neovimオプション
│   │   ├── appearance.lua     # 見た目設定
│   │   ├── keymap.lua         # グローバルキーマップ
│   │   ├── filetype.lua       # ファイルタイプ設定
│   │   └── lsp.lua            # LSP共通設定
│   │
│   ├── lsp/                    # ビルトインLSP設定（Neovim 0.11+）
│   │   ├── init.lua           # LSP設定読み込みエントリーポイント
│   │   ├── bashls.lua         # Bash Language Server
│   │   ├── pyright.lua        # Python
│   │   ├── ts_ls.lua          # TypeScript/JavaScript
│   │   ├── clangd.lua         # C/C++
│   │   ├── lua_ls.lua         # Lua
│   │   ├── rust.lua           # Rust
│   │   └── docker.lua         # Docker
│   │
│   └── plugins/                # プラグイン定義
│       ├── depends.lua         # 依存ライブラリ
│       ├── global.lua          # 汎用プラグイン
│       ├── lsp.lua             # LSP拡張プラグイン
│       ├── appearance.lua      # UI/UX改善
│       ├── telescope.lua       # ファジーファインダー
│       ├── git.lua             # Git統合
│       ├── ai.lua              # Claude Code統合
│       ├── markdown.lua        # Markdown対応
│       │
│       └── config/             # プラグイン個別設定
│           ├── gitsigns.lua
│           ├── lualine.lua
│           ├── noice.lua
│           ├── none-ls.lua
│           ├── nvim-surround.lua
│           ├── nvim-treesitter-context.lua
│           ├── tabset.lua
│           └── vim-illuminate.lua
```

## 主要なキーマップ

### グローバルキーマップ

| キー | モード | 機能 |
|------|--------|------|
| `;` | Normal | コマンドモード（:と入れ替え） |
| `:` | Normal | 文字検索（;と入れ替え） |
| `<Esc><Esc>` | Normal | ハイライト解除 |
| `jj` | Insert | Escapeへ移行 |
| `<C-h>` | Normal | 前のバッファへ |
| `<C-l>` | Normal | 次のバッファへ |

### LSPキーマップ

| キー | モード | 機能 |
|------|--------|------|
| `K` | Normal | ホバードキュメント表示 |
| `gd` | Normal | 定義へジャンプ |
| `gD` | Normal | 宣言へジャンプ |
| `gi` | Normal | 実装へジャンプ |
| `gt` | Normal | 型定義へジャンプ |
| `gr` | Normal | 参照を表示 |
| `gn` | Normal | 変数名変更 |
| `ga` | Normal | コードアクション |
| `gf` | Normal | フォーマット |
| `ge` | Normal | 診断メッセージ表示 |
| `g]` | Normal | 次の診断へ |
| `g[` | Normal | 前の診断へ |
| `<leader>ds` | Normal | ドキュメントシンボル検索 |
| `<leader>ws` | Normal | ワークスペースシンボル検索 |
| `<leader>th` | Normal | インレイヒント切り替え |
| `<leader>cl` | Normal | コードレンズ実行 |
| `<C-k>` | Insert | 署名ヘルプ表示 |

### Telescopeキーマップ

Telescopeプラグインの設定により、ファジーファインダー機能が利用可能です。

### Gitキーマップ

Gitsigns、LazygitプラグインによるGit統合機能が利用可能です。

## プラグイン管理

### プラグインの同期

```vim
:Lazy sync       " プラグインの同期（インストール・更新）
:Lazy clean      " 未使用プラグインの削除
:Lazy restore    " lazy-lock.jsonからバージョンを復元
:Lazy profile    " 起動時のプロファイル確認
```

### プラグインの追加

1. `lua/plugins/[category].lua`に定義を追加
2. 詳細設定が必要な場合は`lua/plugins/config/[plugin-name].lua`を作成
3. Neovimを再起動するか`:Lazy sync`を実行

## LSP設定

このプロジェクトは**Neovim 0.11+のビルトインLSP機能**を使用しています。mason.nvim等のプラグインに依存せず、軽量で高速なLSP環境を実現しています。

### 有効化されているLSPサーバー

- **Bash**: bashls
- **Python**: pyright
- **TypeScript/JavaScript**: ts_ls
- **C/C++**: clangd

### 設定ファイル作成済み（必要に応じて有効化可能）

- **Lua**: lua_ls
- **Rust**: rust_analyzer
- **Docker**: docker_language_server

### LSPサーバーの追加

```bash
# 1. LSPサーバーをシステムにインストール（例: npm）
npm install -g bash-language-server

# または cargo、apt等でインストール
# cargo install rust-analyzer
# sudo apt install clangd
```

```lua
-- 2. lua/lsp/[server].luaを作成
---@type vim.lsp.Config
vim.lsp.config.server_name = {
  cmd = { "server-command", "--stdio" },
  filetypes = { "filetype" },
  root_markers = { ".git" },
  settings = {},
}
vim.lsp.enable("server_name")
```

```lua
-- 3. lua/lsp/init.luaに追加
require("lsp.server_name")
```

```vim
" 4. Neovim再起動して動作確認
:LspInfo
```

### LSPの健全性確認

```vim
:checkhealth lsp
:LspInfo
```

**注意:** Masonは`none-ls`等の他のツールをインストールするために残していますが、LSPサーバーの管理には使用していません。

## カラースキーム

デフォルトは**zenburn**を使用。`lua/plugins/appearance.lua`で変更可能。

```lua
-- 利用可能なテーマ
vim.cmd("colorscheme zenburn")      -- 現在のテーマ
-- vim.cmd("colorscheme dracula-soft")  -- 代替テーマ
-- vim.cmd("colorscheme duskfox")       -- 代替テーマ
```

## トラブルシューティング

### プラグインが読み込まれない

```vim
:Lazy sync
:Lazy clean
:checkhealth lazy
```

### LSPが動作しない

```vim
:LspInfo
:Mason
:checkhealth lsp
```

### Treesitterエラー

```vim
:TSUpdate
:TSInstall <language>
:checkhealth treesitter
```

### 起動が遅い

```vim
:Lazy profile
```

## 設定のカスタマイズ

### Neovimオプションの変更

`lua/config/options.lua`を編集

### キーマップの追加

- **グローバルキーマップ**: `lua/config/keymap.lua`
- **プラグイン専用キーマップ**: プラグイン定義内の`keys`セクション

### 新しいファイルタイプの設定

`lua/config/filetype.lua`を編集

## 開発対象

- 組込みLinux開発（C/Bash）
- Python開発
- TypeScript/JavaScript開発
- Neovim設定自体の開発

## 参考リンク

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## ライセンス

このプロジェクトの設定ファイルは自由に利用・改変可能です。

---

**最終更新**: 2025-12-29
