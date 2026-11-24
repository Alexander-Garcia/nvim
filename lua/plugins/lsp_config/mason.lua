return {
  "williamboman/mason.nvim",
  dependencies = {
    -- nvim-lspconfig must be on the runtimepath before mason-lspconfig runs: its
    -- automatic_enable calls vim.lsp.enable() at startup, which resolves and caches
    -- each config immediately. Without lspconfig's lsp/*.lua defaults (cmd, filetypes,
    -- root_dir), servers like tsc get cached with only our overrides and never attach.
    { "williamboman/mason-lspconfig.nvim", dependencies = { "neovim/nvim-lspconfig" } },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "pyright",
        "vimls",
        "html",
        "cssls",
        "terraformls",
        "tsc",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
      },
    })
  end,
}
