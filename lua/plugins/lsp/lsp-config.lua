return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- python
    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    -- typescript
    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })

    -- lint
    lspconfig.eslint.setup({
      capabilities = capabilities,
    })

    -- java
    lspconfig.jdtls.setup({
      capabilities = capabilities,
    })

    -- docker
    lspconfig.dockerls.setup({
      capabilities = capabilities,
    })

    -- yaml
    lspconfig.yamlls.setup({
      capabilities = capabilities,
    })

    -- terraform
    lspconfig.terraformls.setup({
      capabilities = capabilities,
    })

    -- lua
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
