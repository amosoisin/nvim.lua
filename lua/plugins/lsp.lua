---@type LazyPluginSpec
return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "neovim/nvim-lspconfig" },
            { "echasnovski/mini.completion", version = false },
        },
        config = function()
            require("plugins/config/mason-lspconfig")
        end,
    }
}
