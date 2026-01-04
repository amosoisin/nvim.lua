-- Autotools Language Server設定

---@type vim.lsp.Config
vim.lsp.config.autotools_ls = {
  cmd = { "autotools-language-server" },
  filetypes = { "config", "automake", "make" },
  root_markers = { "configure.ac", "Makefile.am", ".git" },
  settings = {},
}

vim.lsp.enable("autotools_ls")
