require("tabset").setup({
  defaults = {
    tabwidth = 4,
    tabstop = 4,
    expandtab = true
  },
  languages = {
    go = {
      tabwidth = 4,
      expandtab = false
    },
    lua = {
      tabwidth = 2,
      tabstop = 2,
    },
    c = {
      tabwidth = 8,
      tabstop = 8,
      expandtab = false,
    },
    sh = {
      tabwidth = 4,
      tabstop = 4,
      expandtab = false,
    },
    make = {
      tabwidth = 8,
      tabstop = 8,
      expandtab = false,
    },
    html = {
      tabwidth = 2,
      tabstop = 2,
    },
    python = {
      tabwidth = 4,
      tabstop = 4,
      expandtab = true,
    },
    {
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml" },
      config = {
          tabwidth = 2,
          tabstop = 2,
      }
    }
  }
})
