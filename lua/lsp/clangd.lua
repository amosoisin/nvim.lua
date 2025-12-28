-- C/C++ Language Server設定 (clangd)
---@type vim.lsp.Config
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    ".clangd",
    ".git",
  },
  settings = {},
}

vim.lsp.enable("clangd")
