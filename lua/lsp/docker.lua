-- Docker Language Server設定
-- インストール方法: npm install -g dockerfile-language-server-nodejs

---@type vim.lsp.Config
vim.lsp.config.docker_language_server = {
  cmd = { "docker-language-server", "start", "--stdio" },
  filetypes = { "dockerfile", "yaml.docker-compose" },
  root_markers = {
    ".git",
    "Dockerfile",
    "docker-compose.yml",
    "docker-compose.yaml",
    "compose.yml",
    "compose.yaml",
  },
  settings = {},
}

vim.lsp.enable("docker_language_server")
