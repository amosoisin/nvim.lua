-- Bash Language Server設定
---@type vim.lsp.Config
vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  root_markers = { ".git" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
    },
  },
}

vim.lsp.enable("bashls")