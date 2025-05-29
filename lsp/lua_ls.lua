print("Loading Lua LS configuration...")
return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

