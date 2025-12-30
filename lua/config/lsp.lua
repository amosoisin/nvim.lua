-- LSP共通設定ファイル
-- ビルトインLSP機能を使用した設定

-- 診断設定
vim.diagnostic.config({
  virtual_text = true,  -- 仮想テキスト有効化
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

-- 診断サイン設定
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- 全LSPサーバー共通設定
-- 個別のLSP設定とマージされる
vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
          commitCharactersSupport = true,
          deprecatedSupport = true,
          preselectSupport = true,
        },
        completionList = {
          itemDefaults = {
            'commitCharacters',
            'editRange',
            'insertTextFormat',
            'insertTextMode',
            'data',
          }
        }
      },
      -- Semantic tokensのサポート
      semanticTokens = {
        dynamicRegistration = false,
      }
    }
  }
})

-- LspAttach autocommand - 全LSPサーバー共通のキーマップ設定
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- 基本的なナビゲーションとアクション
    vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr, desc = 'LSP: Hover documentation' })
    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { buffer = bufnr, desc = 'LSP: Format' })
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr, desc = 'LSP: References' })
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr, desc = 'LSP: Definition' })
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr, desc = 'LSP: Declaration' })
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = bufnr, desc = 'LSP: Implementation' })
    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = bufnr, desc = 'LSP: Type definition' })
    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = bufnr, desc = 'LSP: Rename' })
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr, desc = 'LSP: Code action' })

    -- 診断（Diagnostics）
    vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', { buffer = bufnr, desc = 'LSP: Show diagnostics' })
    vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { buffer = bufnr, desc = 'LSP: Next diagnostic' })
    vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { buffer = bufnr, desc = 'LSP: Prev diagnostic' })

    -- シンボル検索（Telescope統合）
    vim.keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<CR>', { buffer = bufnr, desc = 'LSP: Document symbols' })
    vim.keymap.set('n', '<leader>ws', '<cmd>Telescope lsp_workspace_symbols<CR>', { buffer = bufnr, desc = 'LSP: Workspace symbols' })

    -- インレイヒント切り替え（Neovim 0.10+）
    if client and client.server_capabilities.inlayHintProvider then
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
      end, { buffer = bufnr, desc = 'LSP: Toggle inlay hints' })
    end

    -- コードレンズ（対応している場合）
    if client and client.server_capabilities.codeLensProvider then
      vim.keymap.set('n', '<leader>cl', '<cmd>lua vim.lsp.codelens.run()<CR>', { buffer = bufnr, desc = 'LSP: Run code lens' })
      -- コードレンズの自動更新
      vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })
    end

    -- 署名ヘルプ（インサートモード）
    vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr, desc = 'LSP: Signature help' })
  end
})

-- ビルトインLSP設定を読み込み
require("lsp")
