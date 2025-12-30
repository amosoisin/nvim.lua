# Neovim設定 チートシート

このチートシートは、Neovim設定のキーマップとコマンドをカテゴリ別に整理したクイックリファレンスです。

---

## 📋 目次

1. [グローバルキーマップ](#グローバルキーマップ)
2. [LSPキーマップ](#lspキーマップ)
3. [Telescope（ファジーファインダー）](#telescopeファジーファインダー)
4. [Git操作](#git操作)
5. [編集機能](#編集機能)
6. [Claude Code（AI支援）](#claude-codeai支援)
7. [ファイル・ナビゲーション](#ファイルナビゲーション)
8. [診断・トラブルシューティング](#診断トラブルシューティング)
9. [プラグイン管理](#プラグイン管理)
10. [UI・ビジュアル](#uiビジュアル)
11. [その他の便利機能](#その他の便利機能)

---

## グローバルキーマップ

### 基本操作

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `;` | Normal | コマンドモード | `:`と入れ替え |
| `:` | Normal | 文字検索 | `;`と入れ替え |
| `<Esc><Esc>` | Normal | ハイライト解除 | 検索ハイライトをクリア |
| `jj` | Insert | Escapeへ移行 | インサートモードを抜ける |

### バッファ操作

| キー | モード | 機能 |
|------|--------|------|
| `<C-h>` | Normal | 前のバッファへ |
| `<C-l>` | Normal | 次のバッファへ |

### その他

| キー | モード | 機能 |
|------|--------|------|
| `<leader>?` | Normal | バッファローカルキーマップ表示（which-key） |

---

## LSPキーマップ

### ナビゲーション

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `K` | Normal | ホバードキュメント | カーソル下のシンボル情報を表示 |
| `gd` | Normal | 定義へジャンプ | シンボルの定義に移動 |
| `gD` | Normal | 宣言へジャンプ | シンボルの宣言に移動 |
| `gi` | Normal | 実装へジャンプ | インターフェースの実装に移動 |
| `gt` | Normal | 型定義へジャンプ | シンボルの型定義に移動 |
| `gr` | Normal | 参照を表示 | シンボルの全参照箇所を表示 |

### コード編集

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `gn` | Normal | 変数名変更 | シンボルをリネーム |
| `ga` | Normal | コードアクション | 利用可能なコードアクションを表示 |
| `gf` | Normal | フォーマット | コードを整形（非同期） |
| `<C-k>` | Insert | 署名ヘルプ | 関数の引数情報を表示 |

### 診断（Diagnostics）

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `ge` | Normal | 診断メッセージ表示 | カーソル位置のエラー/警告を表示 |
| `g]` | Normal | 次の診断へ | 次のエラー/警告に移動 |
| `g[` | Normal | 前の診断へ | 前のエラー/警告に移動 |

### シンボル検索（Telescope統合）

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>ds` | Normal | ドキュメントシンボル検索 | 現在のファイル内のシンボルを検索 |
| `<leader>ws` | Normal | ワークスペースシンボル検索 | プロジェクト全体のシンボルを検索 |

### 高度な機能

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>th` | Normal | インレイヒント切り替え | インレイヒントの表示/非表示 |
| `<leader>cl` | Normal | コードレンズ実行 | 利用可能なコードレンズアクションを実行 |

---

## Telescope（ファジーファインダー）

### ファイル検索

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>ff` | Normal | ファイル検索 | プロジェクト内のファイルを検索 |
| `<leader>fr` | Normal | 最近開いたファイル | 最近使用したファイルを表示 |
| `<leader>fb` | Normal | バッファ一覧 | 開いているバッファを検索 |

### テキスト検索

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>fg` | Normal | Live Grep | プロジェクト全体のテキスト検索 |
| `<leader>tg` | Normal/Visual | Grep String | カーソル下/選択中の文字列を検索 |

### ヘルプ

| キー | モード | 機能 |
|------|--------|------|
| `<leader>fh` | Normal | ヘルプタグ検索 |

---

## Git操作

### Gitsigns（Hunk操作）

#### ナビゲーション

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `]c` | Normal | 次の変更箇所へ | 次のhunkに移動 |
| `[c` | Normal | 前の変更箇所へ | 前のhunkに移動 |

#### Hunk操作

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>hs` | Normal/Visual | Hunkをステージ | カーソル位置/選択範囲のhunkをステージング |
| `<leader>hr` | Normal/Visual | Hunkをリセット | カーソル位置/選択範囲のhunkを元に戻す |
| `<leader>hS` | Normal | バッファ全体をステージ | ファイル全体をステージング |
| `<leader>hR` | Normal | バッファ全体をリセット | ファイル全体を元に戻す |
| `<leader>hp` | Normal | Hunkプレビュー | 変更内容をポップアップで表示 |
| `<leader>hi` | Normal | Hunkインラインプレビュー | 変更内容をインラインで表示 |

#### 情報表示

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>hb` | Normal | Blame表示 | 行の変更履歴を表示 |
| `<leader>hd` | Normal | Diff表示 | 変更差分を表示 |
| `<leader>hD` | Normal | Diff表示（HEAD~） | HEADとの差分を表示 |
| `<leader>hq` | Normal | Quickfixリスト | 変更箇所をquickfixに追加 |
| `<leader>hQ` | Normal | 全てQuickfixリスト | 全変更箇所をquickfixに追加 |

#### 表示切り替え

| キー | モード | 機能 |
|------|--------|------|
| `<leader>tb` | Normal | Blame表示切り替え |
| `<leader>tw` | Normal | 単語Diff切り替え |

#### テキストオブジェクト

| キー | モード | 機能 |
|------|--------|------|
| `ih` | Operator/Visual | Hunk選択 |

### LazyGit

| キー | モード | 機能 |
|------|--------|------|
| `<leader>lg` | Normal | LazyGit起動 |

---

## 編集機能

### コメント（Comment.nvim）

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `gcc` | Normal | 行コメント切り替え | 現在行をコメント化 |
| `gc` | Visual | コメント切り替え | 選択範囲をコメント化 |
| `gbc` | Normal | ブロックコメント切り替え | 現在行をブロックコメント化 |

### Surround（nvim-surround）

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `ys<motion><char>` | Normal | 囲い文字追加 | テキストを囲む（例：`ysiw"` で単語を"で囲む） |
| `ds<char>` | Normal | 囲い文字削除 | 囲み文字を削除（例：`ds"` で"を削除） |
| `cs<old><new>` | Normal | 囲い文字変更 | 囲み文字を変更（例：`cs"'` で"を'に変更） |
| `S<char>` | Visual | 選択範囲を囲む | ビジュアル選択を囲む |

### 自動入力・補完

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<C-l>` | Insert | 括弧から脱出 | in-and-out.nvim |
| - | Insert | 括弧自動入力 | nvim-autopairs（自動） |
| `<C-n>`/`<C-p>` | Insert | 補完候補選択 | mini.completion |

### 関数コメント自動生成（vim-doge）

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>d` | Normal | 関数コメント自動生成 | 関数上で実行、`<Tab>`で移動 |

### 検索・置換

| コマンド | 機能 | 説明 |
|----------|------|------|
| `:GrugFarWithin` | 検索・置換UI | grug-far.nvimの検索置換インターフェース |

### 高速移動

| 機能 | 説明 |
|------|------|
| `j`/`k`長押し | accelerated-jk.nvimで加速 |
| `f`/`F`/`t`/`T` | eyeliner.nvimでジャンプ先をハイライト |

---

## Claude Code（AI支援）

### 基本操作

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>ac` | Normal | Claude Code起動/停止 | トグル |
| `<leader>af` | Normal | Claude Codeフォーカス | ターミナルにフォーカス |
| `<leader>ar` | Normal | Claude Code再開 | --resumeオプション |
| `<leader>aC` | Normal | Claude Code続行 | --continueオプション |
| `<leader>am` | Normal | モデル選択 | 使用するClaudeモデルを選択 |

### ファイル操作

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>ab` | Normal | 現在のバッファを追加 | コンテキストに追加 |
| `<leader>as` | Visual | 選択範囲を送信 | Claudeに送信 |
| `<leader>as` | Normal | ファイルを追加 | ファイラー内（NeoTree等）で使用 |

### Diff管理

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>aa` | Normal | Diff承認 | Claude提案の変更を適用 |
| `<leader>ad` | Normal | Diff拒否 | Claude提案の変更を破棄 |

---

## ファイル・ナビゲーション

### Neo-tree（ファイルツリー）

```vim
:Neotree          " ファイルツリーを開く
:Neotree toggle   " ファイルツリーの表示切り替え
```

### Hop（高速移動）

| コマンド | 機能 |
|----------|------|
| `:HopWord` | 単語へジャンプ |
| `:HopLine` | 行へジャンプ |
| `:HopChar1` | 1文字検索ジャンプ |
| `:HopChar2` | 2文字検索ジャンプ |

### Numb（行番号プレビュー）

`:123` のように行番号を入力すると、自動的にプレビューが表示されます。

### マーク（marks.nvim）

マークが自動的に表示されます。通常のVimマークコマンド（`m{a-zA-Z}`）を使用してください。

---

## 診断・トラブルシューティング

### Trouble（診断リスト）

| キー | モード | 機能 | 説明 |
|------|--------|------|------|
| `<leader>xx` | Normal | 診断一覧 | プロジェクト全体の診断を表示 |
| `<leader>xX` | Normal | バッファ診断一覧 | 現在のバッファの診断を表示 |
| `<leader>cs` | Normal | シンボル一覧 | シンボル情報を表示 |
| `<leader>cl` | Normal | LSP情報 | LSP定義/参照を表示 |
| `<leader>xL` | Normal | Location List | ロケーションリストを表示 |
| `<leader>xQ` | Normal | Quickfix List | Quickfixリストを表示 |

---

## プラグイン管理

### Lazy.nvim

```vim
:Lazy              " Lazy.nvimダッシュボードを開く
:Lazy sync         " プラグインの同期（インストール・更新）
:Lazy clean        " 未使用プラグインの削除
:Lazy restore      " lazy-lock.jsonからバージョンを復元
:Lazy update       " プラグインの更新
:Lazy profile      " 起動時のプロファイル確認
```

---

## UI・ビジュアル

### LSPシンボル一覧（Aerial）

```vim
:AerialOpen        " シンボル一覧を開く
:AerialToggle      " シンボル一覧の表示切り替え
:AerialClose       " シンボル一覧を閉じる
```

### ビジュアル機能

| 機能 | プラグイン | 説明 |
|------|------------|------|
| スクロールバー | nvim-scrollbar | 自動表示 |
| インデントガイド | indent-blankline.nvim | 自動表示 |
| フローティングタイトル | incline.nvim | ウィンドウタイトルを表示 |
| 非アクティブウィンドウ | sunglasses.nvim | 暗く表示（30%シェード） |
| カーソル下シンボル | vim-illuminate | 同じシンボルをハイライト |
| コンテキスト表示 | nvim-treesitter-context | コードブロックの先頭を画面上部に固定 |

### カラースキーム

現在のテーマ: **zenburn**

```vim
" 利用可能なカラースキーム
:colorscheme zenburn      " 現在のテーマ
:colorscheme dracula-soft  " 代替テーマ
:colorscheme duskfox       " 代替テーマ
```

---

## その他の便利機能

### 編集履歴（Atone）

```vim
:Atone             " 編集履歴UIを開く
```

### ノイスUI（Noice）

メッセージ、コマンドライン、ポップアップUIが改善されます（自動）。

### Markdown（render-markdown.nvim）

Markdownファイルを開くと自動的にレンダリングされます。

---

## 便利なVimコマンド

### ヘルスチェック

```vim
:checkhealth        " 全体の健全性チェック
:checkhealth lsp    " LSPの健全性チェック
:checkhealth lazy   " lazy.nvimの健全性チェック
:checkhealth treesitter  " Treesitterの健全性チェック
```

### Treesitter

```vim
:TSUpdate           " パーサーの更新
:TSInstall <lang>   " 特定言語のパーサーをインストール
:TSUninstall <lang> " パーサーのアンインストール
```

### LSP

```vim
:LspInfo            " LSP接続状態の確認
:LspStart           " LSPサーバーの起動
:LspStop            " LSPサーバーの停止
:LspRestart         " LSPサーバーの再起動
```

### Gitsigns

```vim
:Gitsigns toggle_signs              " Git記号の表示切り替え
:Gitsigns toggle_current_line_blame " Blame表示の切り替え
:Gitsigns toggle_word_diff          " 単語Diffの切り替え
```

---

## キーマップの凡例

- `<leader>`: リーダーキー（デフォルトは`\`、多くの場合スペースに設定）
- `<C-x>`: Ctrl + x
- `<S-x>`: Shift + x
- `<M-x>` または `<A-x>`: Alt + x
- `<CR>`: Enter
- `<Esc>`: Escape

---

## 📝 Tips

### LSPが動作しない場合

1. `:LspInfo` でLSPサーバーの接続状態を確認
2. LSPサーバーがインストールされているか確認（`which <server-name>`）
3. `:checkhealth lsp` で問題を診断

### プラグインが読み込まれない場合

1. `:Lazy sync` でプラグインを同期
2. `:checkhealth lazy` で問題を診断
3. `:messages` でエラーメッセージを確認

### 起動が遅い場合

1. `:Lazy profile` でプラグイン読み込み時間を確認
2. 遅延読み込み設定を見直す

---

**最終更新:** 2025-12-31

**関連ドキュメント:**
- [README.md](README.md) - プロジェクト概要とセットアップ
- [CLAUDE.md](CLAUDE.md) - Claude Code向け開発ガイド
- [TODO.md](TODO.md) - タスク管理

**LSP設定について:**
このプロジェクトは**Neovim 0.11+のビルトインLSP機能**を使用しています。LSPサーバーの管理にはプラグインを使用せず、システムに直接インストールします。詳細は[README.md](README.md)または[CLAUDE.md](CLAUDE.md)を参照してください。
